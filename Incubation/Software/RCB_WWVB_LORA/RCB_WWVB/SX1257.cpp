#include "SX1257.h"


#define REGMODE 0x0
#define TX_PA_DRIVER_ENABLE (1<<3)
#define TX_FRONTEND_PLL_ENABLE (1<<2)
#define RX_FRONTEND_PLL_ENABLE (1<<1)
#define RX_STANDBY_ENABLE (1)

#define REG_FRF_RX_MSB 0x1
#define REG_FRF_RX_MID 0x2
#define REG_FRF_RX_LSB 0x3
#define REG_FRF_TX_MSB 0x4
#define REG_FRF_TX_MID 0x5
#define REG_FRF_TX_LSB 0x6

#define REG_TX_GAIN 0x8
#define TX_GAIN_NEG9DB 0x0
#define TX_GAIN_NEG6DB 0x1
#define TX_GAIN_NEG3DB 0x2
#define TX_GAIN_MAX 0x3
#define TX_GAIN_SHIFT 4
#define TX_MIXER_GAIN_MASK 0xF

#define REG_TX_BW 0xA
#define TX_PLL_BW_75K 0x0
#define TX_PLL_BW_150K 0x1
#define TX_PLL_BW_225K 0x2
#define TX_PLL_BW_300K 0x3
#define TX_PLL_BW_SHIFT 5
#define TX_ANAFILT_BW_MASK 0x1f // check datasheet for formula

#define REG_TX_DAC_BW 0xB
#define TX_DAC_FIR_TAP_CNT_MASK 0x7

#define REG_RX_ANA_GAIN 0xC
#define RX_LNA_GAIN_SHIFT 5
#define RX_LNA_GAIN_MASK 0x7
#define RX_LNA_BASEBAND_GAIN_SHIFT 2
#define RX_LNA_BASEBAND_GAIN_MASK 0x7
#define RX_LNA_IMPEDANCE_50 (0<<0)

#define REG_RX_BW 0xD
#define RX_ADC_BW_100K_200K 0x2
#define RX_ADC_BW_200K_400K 0x5
#define RX_ADC_BW_GT400K 0x7
#define RX_ADC_BW_SHIFT 5
#define RX_ADC_BW_MASK 0x7
#define RX_ADC_TRIM_32M 0x6
#define RX_ADC_TRIM_36M 0x5
#define RX_ADC_TRIM_SHIFT 2
#define RX_ADC_TRIM_MASK 0x7
#define RX_ANALOG_FILT_BW_750K 0x0
#define RX_ANALOG_FILT_BW_500K 0x1
#define RX_ANALOG_FILT_BW_375K 0x2
#define RX_ANALOG_FILT_BW_250K 0x3


#define REG_RX_PLL_BW 0xE
#define RX_PLL_BW_75K 0x0
#define RX_PLL_BW_150K 0x1
#define RX_PLL_BW_225K 0x2
#define RX_PLL_BW_300K 0x3
#define RX_PLL_BW_SHIFT 1
#define RX_PLL_BW_MASK 0x3
#define RX_ADC_TEMP_EN 1

#define REG_DIO_MAPPING 0xF

#define REG_CLK_SELECT 0x10
#define DIG_LOOPBACK (1<<3)
#define RF_LOOPBACK (1<<2)
#define CLK_OUT_ENABLE (1<<1)
#define TX_DAC_CLK_SEL_XTAL (0<<0)
#define TX_DAC_CLK_SEL_CLK_IN (1<<0)

#define REG_MODE_STATUS 0x11
#define RX_PLL_LOCK (1<<1)
#define TX_PLL_LOCK (1<<0)

#define REG_LOW_BAT_THRESH 0x1A // useless for me


SX1257Class::SX1257Class()
{
  _ss = SX1257_NSS;
  _reset = SX1257_RST;


  sx1257_stats.spi_I_irq_counter = 0;
  sx1257_stats.spi_I_RX_DMA_IRQHandler_counter = 0;
  sx1257_stats.spi_I_RX_DMAHalfComplete_counter = 0;
  sx1257_stats.spi_I_RX_DMAComplete_counter = 0;
  sx1257_stats.spi_I_TX_DMA_IRQHandler_counter = 0;
  sx1257_stats.spi_I_TX_DMAHalfComplete_counter = 0;
  sx1257_stats.spi_I_TX_DMAComplete_counter = 0;

  sx1257_stats.spi_Q_irq_counter = 0;
  sx1257_stats.spi_Q_RX_DMAHalfComplete_counter = 0;
  sx1257_stats.spi_Q_RX_DMAComplete_counter = 0;
  sx1257_stats.spi_Q_TX_DMAHalfComplete_counter = 0;
  sx1257_stats.spi_Q_TX_DMAComplete_counter = 0;

  sx1257_stats.HAL_SPI_RxCpltCallback_counter = 0;
  sx1257_stats.HAL_SPI_RxHalfCpltCallback_counter = 0;
  sx1257_stats.HAL_SPI_ErrorCallback_run = 0;
  sx1257_stats.HAL_SPI_MspInit_run = 0;
  sx1257_stats.HAL_SPI_MspInit_SPI1_run = 0;
  sx1257_stats.HAL_DMA_ErrorCallback_run = 0;
  sx1257_stats.SPI_DMAError_run = 0;
  sx1257_stats.SPI_DMAAbort_run = 0;
  sx1257_stats.SPI_DMAReceiveCplt_run = 0;
  sx1257_stats.SPI_DMAHalfReceiveCplt_run = 0;
  sx1257_stats.HAL_SPI_SuspendCallback_run = 0;

  rx_dma_state = DMA_STOPPED;
  tx_dma_state = DMA_STOPPED;



}



int SX1257Class::init(bool first) {

    if ( first ) {

    //I_rxBuffer = (uint32_t*)D2_AHBSRAM_BASE;
    //I_txBuffer = I_rxBuffer + IQ_BUFFER_SIZE;
    //Q_rxBuffer = I_txBuffer + IQ_BUFFER_SIZE;
    //Q_txBuffer = Q_rxBuffer + IQ_BUFFER_SIZE;

    // Init the GPIOs used just for control
    wwvb_gpio_pinmode(SX1257_NSS, OUTPUT);
    wwvb_gpio_pinmode(SX1257_RST, OUTPUT);  

    wwvb_digital_write(SX1257_NSS, 1);
    wwvb_digital_write(SX1257_RST, 0); // RESET IS ACTIVE HIGH

    // Init the STM32 SPI6 interface
    GPIO_InitTypeDef GPIO_InitStruct = {0};

    // SPI6 SCK Pin Configuration
    GPIO_InitStruct.Pin = WWVB_Pins[SX1257_SCK].GPIO_Pin;  
    GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
    GPIO_InitStruct.Alternate = GPIO_AF5_SPI6;  // Alternate function for SPI6
    HAL_GPIO_Init(WWVB_Pins[SX1257_SCK].GPIO_Group, &GPIO_InitStruct);

    // SPI6 MISO Pin Configuration
    GPIO_InitStruct.Pin = WWVB_Pins[SX1257_MISO].GPIO_Pin;  
    HAL_GPIO_Init(WWVB_Pins[SX1257_MISO].GPIO_Group, &GPIO_InitStruct);

    // SPI6 MOSI Pin Configuration
    GPIO_InitStruct.Pin = WWVB_Pins[SX1257_MOSI].GPIO_Pin; 
    GPIO_InitStruct.Alternate = GPIO_AF8_SPI6; // this pin uses AF8 for some reason
    HAL_GPIO_Init(WWVB_Pins[SX1257_MOSI].GPIO_Group, &GPIO_InitStruct);

    _spi_mgmt.Instance = SPI6;
    _spi_mgmt.Init.Mode = SPI_MODE_MASTER;  // SPI mode (Master/Slave)
    _spi_mgmt.Init.Direction = SPI_DIRECTION_2LINES;  // Full duplex mode
    _spi_mgmt.Init.DataSize = SPI_DATASIZE_8BIT;  // 8-bit data frame format
    _spi_mgmt.Init.CLKPolarity = SPI_POLARITY_LOW;  // Clock polarity
    _spi_mgmt.Init.CLKPhase = SPI_PHASE_1EDGE;  // Clock phase
    _spi_mgmt.Init.NSS = SPI_NSS_SOFT;  // NSS signal is managed by software
    _spi_mgmt.Init.NSSPolarity = SPI_NSS_POLARITY_LOW;
    _spi_mgmt.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_64;  // Baud rate prescaler
    _spi_mgmt.Init.FirstBit = SPI_FIRSTBIT_MSB;  // Data is transmitted MSB first
    _spi_mgmt.Init.TIMode = SPI_TIMODE_DISABLE;  // Disable TI mode
    _spi_mgmt.Init.CRCCalculation = SPI_CRCCALCULATION_DISABLE;  // Disable CRC calculation
    _spi_mgmt.Init.CRCPolynomial = 7;  // Polynomial for CRC calculation

    if ( HAL_SPI_Init(&_spi_mgmt) != HAL_OK ) {
      Serial.println("FAILED TO INIT SX1257 MANAGEMENT SPI");
      return -1;
    }


    // Init the STM32 SPI1 interface, I Data
    _spi_I_Data.Instance = SPI1;
    _spi_I_Data.Init.Mode = SPI_MODE_SLAVE;  // SPI mode (Master/Slave)
    _spi_I_Data.Init.Direction = SPI_DIRECTION_2LINES;  // different speed limits
    _spi_I_Data.Init.DataSize = SPI_DATASIZE_8BIT;  // data frame format
    _spi_I_Data.Init.CLKPolarity = SPI_POLARITY_LOW;  // Clock polarity CPOL
    _spi_I_Data.Init.CLKPhase = SPI_PHASE_1EDGE;  // Clock phase CPHA
    _spi_I_Data.Init.NSS = SPI_NSS_SOFT;  // NSS signal is managed by software
    _spi_I_Data.Init.NSSPolarity = SPI_NSS_POLARITY_HIGH;
    _spi_I_Data.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_2;  // Baud rate prescaler
    _spi_I_Data.Init.FirstBit = SPI_FIRSTBIT_LSB;  //
    _spi_I_Data.Init.TIMode = SPI_TIMODE_DISABLE;  // Disable TI mode
    _spi_I_Data.Init.CRCCalculation = SPI_CRCCALCULATION_DISABLE;  // Disable CRC calculation
    _spi_I_Data.Init.CRCPolynomial = 7;  // Polynomial for CRC calculation
    _spi_I_Data.Init.IOSwap = SPI_IO_SWAP_ENABLE; // messed up on board, swap MISO and MOSI with respect to STM32
    _spi_I_Data.Init.MasterKeepIOState = SPI_MASTER_KEEP_IO_STATE_ENABLE;
    _spi_I_Data.Init.NSSPMode = SPI_NSS_PULSE_DISABLE;
    _spi_I_Data.Init.FifoThreshold = SPI_FIFO_THRESHOLD_01DATA;

    if ( HAL_SPI_Init(&_spi_I_Data) != HAL_OK ) { // Calls MSP Init
      Serial.println("FAILED TO INIT SX1257 I Data SPI");
      return -1;
    }
    _spi_I_Data.Instance->CFG2 |= SPI_CFG2_AFCNTR; // hack, keep it as SPI mode always

    // Init the STM32 SPI2 interface, Q Data
    _spi_Q_Data.Instance = SPI2;
    _spi_Q_Data.Init.Mode = SPI_MODE_SLAVE;  // SPI mode (Master/Slave)
    _spi_Q_Data.Init.Direction = SPI_DIRECTION_2LINES;  // RX only mode, different speed limits
    _spi_Q_Data.Init.DataSize = SPI_DATASIZE_8BIT;  // data frame format
    _spi_Q_Data.Init.CLKPolarity = SPI_POLARITY_LOW;  // Clock polarity, CPOL
    _spi_Q_Data.Init.CLKPhase = SPI_PHASE_1EDGE;  // Clock phase, CPHA
    _spi_Q_Data.Init.NSS = SPI_NSS_SOFT;  // NSS signal is managed by software
    _spi_Q_Data.Init.NSSPolarity = SPI_NSS_POLARITY_HIGH;
    _spi_Q_Data.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_2;  // Baud rate prescaler
    _spi_Q_Data.Init.FirstBit = SPI_FIRSTBIT_LSB;  // 
    _spi_Q_Data.Init.TIMode = SPI_TIMODE_DISABLE;  // Disable TI mode
    _spi_Q_Data.Init.CRCCalculation = SPI_CRCCALCULATION_DISABLE;  // Disable CRC calculation
    _spi_Q_Data.Init.CRCPolynomial = 7;  // Polynomial for CRC calculation
    _spi_Q_Data.Init.IOSwap = SPI_IO_SWAP_ENABLE; // messed up on board, swap MISO and MOSI with respect to STM32
    _spi_Q_Data.Init.MasterKeepIOState = SPI_MASTER_KEEP_IO_STATE_ENABLE;
    _spi_Q_Data.Init.NSSPMode = SPI_NSS_PULSE_DISABLE;
    _spi_Q_Data.Init.FifoThreshold = SPI_FIFO_THRESHOLD_01DATA;

    if ( HAL_SPI_Init(&_spi_Q_Data) != HAL_OK ) {
      Serial.println("FAILED TO INIT SX1257 I Data SPI");
      return -1;
    }
    _spi_Q_Data.Instance->CFG2 |= SPI_CFG2_AFCNTR; // hack, keep it as SPI mode always
    __DSB();
    __ISB();
    __DMB(); // just to guarantee what I read back next is up to date

    
    Serial.println("******************* DEBUG SPI CONFIG , SPI_I_DATA *****************");
    Serial.print("SPI_CR1: 0x");
    Serial.print(_spi_I_Data.Instance->CR1, HEX);
    Serial.print(" , SPI_CR2: 0x");
    Serial.print(_spi_I_Data.Instance->CR2, HEX);
    Serial.print(" , SPI_CFG1: 0x");
    Serial.print(_spi_I_Data.Instance->CFG1, HEX);
    Serial.print(" , SPI_CFG2: 0x");
    Serial.print(_spi_I_Data.Instance->CFG2, HEX);
    Serial.print(" , SPI_I2SCFGR: 0x");
    Serial.println(_spi_I_Data.Instance->I2SCFGR, HEX);
    


    // Configure DFSDMs as well
    hdfsdm_I.Instance = SX1257_I_DFSDM_CHANNEL;
    // channel configuration
    hdfsdm_I.Init.OutputClock.Activation = DISABLE; // not using DFSDM serial channels
    hdfsdm_I.Init.Input.Multiplexer = DFSDM_CHANNEL_INTERNAL_REGISTER;
    hdfsdm_I.Init.Input.DataPacking = DFSDM_CHANNEL_STANDARD_MODE; // this may be important later for DMA operation
      // for now , software just write uint16_t and initiate conversion
    hdfsdm_I.Init.Input.Pins = DFSDM_CHANNEL_SAME_CHANNEL_PINS;
    //hdfsdm_I.Init.SerialInterface Irrelevant for this case
    hdfsdm_I.Init.Awd.FilterOrder = DFSDM_FILTER_SINC3_ORDER;
    hdfsdm_I.Init.Awd.Oversampling = 4;
    hdfsdm_I.Init.Offset = 0; // not quite sure about this one, DC offset parameter?
    hdfsdm_I.Init.RightBitShift = 0; // shift data before hand
    if ( HAL_DFSDM_ChannelInit_Debug(&hdfsdm_I) != HAL_OK ) {
      Serial.println("Failed to initialize HDFSDM_I!!!!!");
      return -1;
    }




    // Configure DFSDMs as well
    hdfsdm_Q.Instance = SX1257_Q_DFSDM_CHANNEL;
    // channel configuration
    hdfsdm_Q.Init.OutputClock.Activation = DISABLE; // not using DFSDM serial channels
    hdfsdm_Q.Init.Input.Multiplexer = DFSDM_CHANNEL_INTERNAL_REGISTER;
    hdfsdm_Q.Init.Input.DataPacking = DFSDM_CHANNEL_STANDARD_MODE; // this may be important later for DMA operation
      // for now , software just write uint16_t and initiate conversion
    hdfsdm_Q.Init.Input.Pins = DFSDM_CHANNEL_SAME_CHANNEL_PINS;
    //hdfsdm_I.Init.SerialInterface Irrelevant for this case
    hdfsdm_Q.Init.Awd.FilterOrder = DFSDM_FILTER_SINC3_ORDER;
    hdfsdm_Q.Init.Awd.Oversampling = 4;
    hdfsdm_Q.Init.Offset = 0; // not quite sure about this one, DC offset parameter?
    hdfsdm_Q.Init.RightBitShift = 0; // shift data before hand
    if ( HAL_DFSDM_ChannelInit_Debug(&hdfsdm_Q) != HAL_OK ) {
      Serial.println("Failed to initialize HDFSDM_Q!!!!!");
      return -1;
    }





    
    // Filter configuration
    hdfsdm_filt_I.Instance = DFSDM1_Filter0;
    hdfsdm_filt_I.Init.RegularParam.Trigger = DFSDM_FILTER_SW_TRIGGER;
    hdfsdm_filt_I.Init.RegularParam.FastMode = ENABLE;
    hdfsdm_filt_I.Init.RegularParam.DmaMode = ENABLE;
    hdfsdm_filt_I.Init.InjectedParam.Trigger = DFSDM_FILTER_SW_TRIGGER;
    hdfsdm_filt_I.Init.InjectedParam.ScanMode = DISABLE;
    hdfsdm_filt_I.Init.InjectedParam.DmaMode = DISABLE;
    hdfsdm_filt_I.Init.InjectedParam.ExtTrigger = 0; // not used
    hdfsdm_filt_I.Init.InjectedParam.ExtTriggerEdge = DFSDM_FILTER_EXT_TRIG_RISING_EDGE;
    hdfsdm_filt_I.Init.FilterParam.SincOrder = DFSDM_FILTER_SINC5_ORDER;
    hdfsdm_filt_I.Init.FilterParam.Oversampling = 4;
    hdfsdm_filt_I.Init.FilterParam.IntOversampling = 1;
    hdfsdm_filt_I.RegularContMode = DFSDM_CONTINUOUS_CONV_ON; // don't actually need, used internally by API, but just listing here
    hdfsdm_filt_I.RegularTrigger = DFSDM_FILTER_SW_TRIGGER;
    hdfsdm_filt_I.InjectedTrigger = DFSDM_FILTER_SW_TRIGGER;
    hdfsdm_filt_I.ExtTriggerEdge = DFSDM_FILTER_EXT_TRIG_RISING_EDGE;
    hdfsdm_filt_I.InjectedScanMode = DISABLE;
    hdfsdm_filt_I.InjectedChannelsNbr = 0;
    hdfsdm_filt_I.InjConvRemaining = 0;
    if ( HAL_DFSDM_FilterInit_Debug(&hdfsdm_filt_I) != HAL_OK ) {
      Serial.println("FAILED TO INIT DFSDM FILTER FOR CHANNEL I");
      return -1;
    }
    if ( HAL_DFSDM_FilterConfigRegChannel_Debug(&hdfsdm_filt_I, DFSDM_CHANNEL_0, DFSDM_CONTINUOUS_CONV_ON) != HAL_OK ) {
      Serial.println("FAILED TO CONFIGURE FILTER CHANNEL CONFIG");
      return -1;
    }

    
    // Filter configuration
    hdfsdm_filt_Q.Instance = DFSDM1_Filter1;
    hdfsdm_filt_Q.Init.RegularParam.Trigger = DFSDM_FILTER_SW_TRIGGER;
    hdfsdm_filt_Q.Init.RegularParam.FastMode = ENABLE;
    hdfsdm_filt_Q.Init.RegularParam.DmaMode = ENABLE;
    hdfsdm_filt_Q.Init.InjectedParam.Trigger = DFSDM_FILTER_SW_TRIGGER;
    hdfsdm_filt_Q.Init.InjectedParam.ScanMode = DISABLE;
    hdfsdm_filt_Q.Init.InjectedParam.DmaMode = DISABLE;
    hdfsdm_filt_Q.Init.InjectedParam.ExtTrigger = 0; // not used
    hdfsdm_filt_Q.Init.InjectedParam.ExtTriggerEdge = DFSDM_FILTER_EXT_TRIG_RISING_EDGE;
    hdfsdm_filt_Q.Init.FilterParam.SincOrder = DFSDM_FILTER_SINC5_ORDER;
    hdfsdm_filt_Q.Init.FilterParam.Oversampling = 4;
    hdfsdm_filt_Q.Init.FilterParam.IntOversampling = 1;
    hdfsdm_filt_Q.RegularContMode = DFSDM_CONTINUOUS_CONV_ON;
    hdfsdm_filt_Q.RegularTrigger = DFSDM_FILTER_SW_TRIGGER;
    hdfsdm_filt_Q.InjectedTrigger = DFSDM_FILTER_SW_TRIGGER;
    hdfsdm_filt_Q.ExtTriggerEdge = DFSDM_FILTER_EXT_TRIG_RISING_EDGE;
    hdfsdm_filt_Q.InjectedScanMode = DISABLE;
    hdfsdm_filt_Q.InjectedChannelsNbr = 0;
    hdfsdm_filt_Q.InjConvRemaining = 0;
    if ( HAL_DFSDM_FilterInit_Debug(&hdfsdm_filt_Q) != HAL_OK ) {
      Serial.println("FAILED TO INIT DFSDM FILTER FOR CHANNEL I");
      return -1;
    }
    if ( HAL_DFSDM_FilterConfigRegChannel_Debug(&hdfsdm_filt_Q, DFSDM_CHANNEL_1, DFSDM_CONTINUOUS_CONV_ON) != HAL_OK ) {
      Serial.println("FAILED TO CONFIGURE FILTER CHANNEL CONFIG");
      return -1;
    }


  }

  // toggle the reset
  wwvb_digital_write(SX1257_RST, 1);
  delay(10);
  wwvb_digital_write(SX1257_RST, 0); 
  delay(10);

  // write some basic registers that should never change for current board design
  writeRegister(REG_RX_ANA_GAIN, 0x3c); // 50 ohm LNA input impedance is key setting
  writeRegister(REG_RX_BW, (RX_ADC_BW_GT400K << RX_ADC_BW_SHIFT) + 
      (RX_ADC_TRIM_32M << RX_ADC_TRIM_SHIFT) + RX_ANALOG_FILT_BW_500K ); //32MHz is key, that's what PLL is giving
  //writeRegister(REG_CLK_SELECT, DIG_LOOPBACK + CLK_OUT_ENABLE + TX_DAC_CLK_SEL_XTAL); // Need clock out and crystal path for TX
  //Serial.println("********************* HACK ENABLE DIGITAL LOOPBACK **************************");

  writeRegister(REG_CLK_SELECT, CLK_OUT_ENABLE + TX_DAC_CLK_SEL_XTAL); // Need clock out and crystal path for TX
  

  // Hacking it, using digital loopback, if I write 1, i should see 1, and vice versa
  // just use as GPIOs
  /*
  wwvb_gpio_pinmode(SX1257_I_IN, OUTPUT);
  wwvb_gpio_pinmode(SX1257_I_OUT, INPUT);
  wwvb_gpio_pinmode(SX1257_Q_IN, OUTPUT);
  wwvb_gpio_pinmode(SX1257_Q_OUT, INPUT);
  */

  isTransmitting = 0;
  isReceiving = 0;


  dump_dfsdm_regs();

  dumpRegisters(Serial);

  wwvb_gpio_pinmode(SDR_TX_RX_SEL, OUTPUT);
  set_antenna(0);
  Serial.println("SX1257 init successful!");
}


void SX1257Class::dump_dfsdm_regs() {

  char debug_buf[1024];

  sprintf(debug_buf, "HDFSDM I Channel registers: CFGR1=%08x, CFGR2=%08x, CHAWSCDR=%08x, CHWDATAR=%08x, CHDATINR=%08x\r\n",
    hdfsdm_I.Instance->CHCFGR1,
    hdfsdm_I.Instance->CHCFGR2,
    hdfsdm_I.Instance->CHAWSCDR,
    hdfsdm_I.Instance->CHWDATAR,
    hdfsdm_I.Instance->CHDATINR);
  Serial.print(debug_buf);


  sprintf(debug_buf, "HDFSDM I Filter registers: FLTCR1=%08x, "
  "FLTCR2=%08x, FLTISR=%08x, FLTICR=%08x, FLTJCHGR=%08x, "
  "FLTFCR=%08x, FLTJDATAR=%08x, FLTRDATAR=%08x, FLTAWHTR=%08x, "
  "FLTAWLTR=%08x, FLTAWSR-%08x, FLTAWCFR=%08x, FLTEXMAX=%08x, "
  "FLTEXMIN=%08x, FLTCNVTIMR=%08x\r\n",
  hdfsdm_filt_I.Instance->FLTCR1,
  hdfsdm_filt_I.Instance->FLTCR2,
  hdfsdm_filt_I.Instance->FLTISR,
  hdfsdm_filt_I.Instance->FLTICR,
  hdfsdm_filt_I.Instance->FLTJCHGR,
  hdfsdm_filt_I.Instance->FLTFCR,
  hdfsdm_filt_I.Instance->FLTJDATAR,
  hdfsdm_filt_I.Instance->FLTRDATAR,
  hdfsdm_filt_I.Instance->FLTAWHTR,
  hdfsdm_filt_I.Instance->FLTAWLTR,
  hdfsdm_filt_I.Instance->FLTAWSR,
  hdfsdm_filt_I.Instance->FLTAWCFR,
  hdfsdm_filt_I.Instance->FLTEXMAX,
  hdfsdm_filt_I.Instance->FLTEXMIN,
  hdfsdm_filt_I.Instance->FLTCNVTIMR
  );
  Serial.print(debug_buf);


}
void SX1257Class::debug() {
  uint8_t val = 0;
  writeRegister(REGMODE, 0xf);
  val = readRegister(REGMODE);
  Serial.print("SX1257 debug mode = 0x");
  Serial.println(val, HEX);
}


int SX1257Class::set_tx_mode(bool tx_frontend_pll, bool tx_pa_driver) {
  uint8_t cur_reg = 0;
  cur_reg = readRegister(REGMODE);

  Serial.print("SX1257 Set TX frontend_pll=");
  Serial.print(tx_frontend_pll);
  Serial.print(" , pa_driver=");
  Serial.print(tx_pa_driver);
  Serial.print(" , cur mode = 0x");
  Serial.println(cur_reg, HEX);

  if ( tx_frontend_pll ) cur_reg |= TX_FRONTEND_PLL_ENABLE;
  else cur_reg &= (~TX_FRONTEND_PLL_ENABLE);

  if ( tx_pa_driver ) cur_reg |= TX_PA_DRIVER_ENABLE;
  else cur_reg &= (~TX_PA_DRIVER_ENABLE);

  writeRegister(REGMODE, cur_reg);
  return 0;

}
int SX1257Class::set_rx_mode(bool rx_frontend_pll, bool standby) {
  uint8_t cur_reg = 0;
  cur_reg = readRegister(REGMODE);

  Serial.print("SX1257 Set RX frontend_pll=");
  Serial.print(rx_frontend_pll);
  Serial.print(" , standby_mode=");
  Serial.println(standby);

  if ( rx_frontend_pll ) cur_reg |= RX_FRONTEND_PLL_ENABLE;
  else cur_reg &= (~RX_FRONTEND_PLL_ENABLE);

  if ( standby ) cur_reg |= RX_STANDBY_ENABLE;
  else cur_reg &= (~RX_STANDBY_ENABLE);

  writeRegister(REGMODE, cur_reg);
  return 0;
}


// frequency calculation
// 36MHz = frequency resolution = 68.66455 Hz, 0xCB5555 = 915MHz
int SX1257Class::set_tx_freq(long frequency) {
  _txfrequency = frequency;

  //uint32_t frf = (uint32_t)( ((float)frequency) / 68.66455);
  uint32_t frf = (uint32_t)( ((float)frequency) / 61.035156); // 32MHz
  Serial.print("SX1257 Set TX Frequency 0x");
  Serial.println(frf, HEX);

  writeRegister(REG_FRF_TX_MSB, (uint8_t)(frf >> 16));
  writeRegister(REG_FRF_TX_MID, (uint8_t)(frf >> 8));
  writeRegister(REG_FRF_TX_LSB, (uint8_t)(frf >> 0));
  return 0;
}

int SX1257Class::set_rx_freq(long frequency) {
  _rxfrequency = frequency;
  
  //uint32_t frf = (uint32_t)( ((float)frequency) / 68.66455);
  uint32_t frf = (uint32_t)( ((float)frequency) / 61.035156); // 32MHz
  Serial.print("SX1257 Set RX Frequency 0x");
  Serial.println(frf, HEX);

  writeRegister(REG_FRF_RX_MSB, (uint8_t)(frf >> 16));
  writeRegister(REG_FRF_RX_MID, (uint8_t)(frf >> 8));
  writeRegister(REG_FRF_RX_LSB, (uint8_t)(frf >> 0));
  return 0;
}


int SX1257Class::set_tx_parameters(uint8_t dac_gain, uint8_t mixer_gain,
  uint8_t pll_bw, uint8_t analog_filter_bw,
  uint8_t tx_fir_ntaps) {

  writeRegister(REG_TX_GAIN, ( (dac_gain & TX_GAIN_MAX) << TX_GAIN_SHIFT) +
    (mixer_gain & TX_MIXER_GAIN_MASK) );
  writeRegister(REG_TX_BW, ( (pll_bw & TX_PLL_BW_300K) << TX_PLL_BW_SHIFT) +
    (analog_filter_bw & TX_ANAFILT_BW_MASK) );
  writeRegister(REG_TX_DAC_BW, tx_fir_ntaps & TX_DAC_FIR_TAP_CNT_MASK);

  return 0;
}

int SX1257Class::set_rx_parameters(uint8_t lna_gain, uint8_t baseband_gain,
  uint8_t adc_bw, uint8_t analog_filter_bw, 
  uint8_t pll_bw) {

  writeRegister(REG_RX_ANA_GAIN, ((lna_gain & RX_LNA_GAIN_MASK) << RX_LNA_GAIN_SHIFT) + 
    ((baseband_gain & RX_LNA_BASEBAND_GAIN_MASK) << RX_LNA_BASEBAND_GAIN_SHIFT) + RX_LNA_IMPEDANCE_50);
  
  writeRegister(REG_RX_BW, ((adc_bw & RX_ADC_BW_MASK) << RX_ADC_BW_SHIFT) + 
    (RX_ADC_TRIM_32M << RX_ADC_TRIM_SHIFT) + (analog_filter_bw & RX_ANALOG_FILT_BW_250K)  );

  writeRegister(REG_RX_PLL_BW, ((pll_bw & RX_PLL_BW_MASK) << RX_PLL_BW_SHIFT) ); // always disable temperature

}

int SX1257Class::get_status(bool * rx_pll_lock, bool * tx_pll_lock) {
  uint8_t val = 0;
  val = readRegister(REG_MODE_STATUS);
  if ( rx_pll_lock ) {
    if ( val & RX_PLL_LOCK ) {
      *rx_pll_lock = 1;
    } else {
      *rx_pll_lock = 0;
    }
  }
  if ( tx_pll_lock ){
    if ( val & TX_PLL_LOCK ) {
      *tx_pll_lock = 1;
    } else {
      *rx_pll_lock = 0;
    }
  }
  return 0;
}

void SX1257Class::dumpRegisters(arduino::Stream& out) {
  for (int i = 0; i < 0x1a; i++) {
    out.print("SX1257 Register 0x");
    out.print(i, HEX);
    out.print(": 0x");
    out.println(readRegister(i), HEX);
  }
}


uint8_t SX1257Class::readRegister(uint8_t address) {
  //Serial.println("SX1257 read register");
  return singleTransfer(address & 0x7f, 0x00);
}
void SX1257Class::writeRegister(uint8_t address, uint8_t value) {
  //Serial.println("SX1257 write register");
  singleTransfer(address | 0x80, value);
}

uint8_t SX1257Class::singleTransfer(uint8_t address, uint8_t value) {

  uint8_t response;
  wwvb_digital_write(SX1257_NSS, LOW);
  delayMicroseconds(10);

  HAL_SPI_TransmitReceive(&_spi_mgmt, &address, &response, sizeof(address), HAL_MAX_DELAY);  //ignore receive data

  HAL_SPI_TransmitReceive(&_spi_mgmt, &value, &response, sizeof(value), HAL_MAX_DELAY);

  delayMicroseconds(10);
  wwvb_digital_write(SX1257_NSS, HIGH);
  delayMicroseconds(10);
  
  /*
  Serial.print("SX1257 Single transfer addr=0x");
  Serial.print(address,HEX);
  Serial.print(", value = 0x");
  Serial.print(value,HEX);
  Serial.print(" , response = 0x");
  Serial.println(response, HEX);
  */

  return response;

}

int SX1257Class::set_antenna(bool tx) {
  if ( tx ) {
    wwvb_digital_write(SDR_TX_RX_SEL, 1); // 1 for output1, TX
  } else {
    wwvb_digital_write(SDR_TX_RX_SEL, 0); // 0 for output2, RX
  }
  return 0;
}


void SX1257Class::write_I(uint8_t val) {
  HAL_SPI_Transmit(&_spi_I_Data, &val, sizeof(val), HAL_MAX_DELAY);
}

void SX1257Class::write_Q(uint8_t val) {
  HAL_SPI_Transmit(&_spi_Q_Data, &val, sizeof(val), HAL_MAX_DELAY);
}



/************* Stream class stuff ******/
size_t SX1257Class::write(uint8_t byte) {
  return 0;
}
size_t SX1257Class::write(const uint8_t *buffer, size_t size) {
  return 0;
}

  // from Stream
int SX1257Class::available() {
  return 0;
}

int SX1257Class::read() {
  return 0;
}
int SX1257Class::peek() {
  return 0;
}
void SX1257Class::flush() {
  return;
}




/***************************** I/Q data path code ****************************/

/*
int SX1257Class::disable_dma()
{
  HAL_StatusTypeDef stat_val = HAL_OK; 
  Serial.println("Disabling I RX DMA!");
  // SPI1 = I data
  stat_val = HAL_SPI_DMAStop_Fix(&_spi_I_Data);
  if ( stat_val != HAL_OK ) {
    Serial.print("Failed to stop SPI1 RX DMA! 0x");
    Serial.println(stat_val, HEX);
  }
  return 0;
  // SPI2 = Q data 
  Serial.println("Disabling Q RX DMA!");
  stat_val = HAL_SPI_DMAStop_Fix(&_spi_Q_Data);
  if ( stat_val != HAL_OK ) {
    Serial.print("Failed to stop SPI2 RX DMA! 0x");
    Serial.println(stat_val, HEX);
  }
  rx_dma_state = DMA_STOPPED;
  return 0;
}
*/

/*
int SX1257Class::enable_rx_dma()
{
  HAL_StatusTypeDef stat_val = HAL_OK; 
  Serial.println("Enabling RX DMA!");
  //SPI1 = I data
  Serial.println("Enabling SPI1 I data Receive DMA");
  stat_val = HAL_SPI_Receive_DMA_NoStart(&_spi_I_Data, (uint8_t*) I_rxBuffer, IQ_BUFFER_SIZE );
  if ( stat_val != HAL_OK ) {
    Serial.print("Failed to start SPI1 RX DMA! 0x");
    Serial.println(stat_val, HEX);
  }
  // SPI2 = Q data 
  Serial.println("Enabling SPI1 Q data Receive DMA");
  stat_val = HAL_SPI_Receive_DMA_NoStart(&_spi_Q_Data, (uint8_t*) Q_rxBuffer, IQ_BUFFER_SIZE  );
  if ( stat_val != HAL_OK ) {
    Serial.print("Failed to start SPI2 RX DMA! 0x");
    Serial.println(stat_val, HEX);
  }
  __HAL_SPI_ENABLE(&_spi_I_Data);
  __HAL_SPI_ENABLE(&_spi_Q_Data);
  rx_dma_state = DMA_RUNNING;
  return 0;
}

void SX1257Class::debug_print_rx_dma_registers() {
  char print_buf[1024];
  __DSB();
  __ISB();
  __DMB(); // just to guarantee what I read back next is up to date

  sprintf(print_buf, "RX I DMA registers: CR=0x%x , " 
    "NDTR=0x%x , PAR=0x%x, M0AR=0x%x, M1AR=0x%x, FCR=0x%x",
     ( ((DMA_Stream_TypeDef *)(hdma_spi1_rx.Instance))->CR),
     ( ((DMA_Stream_TypeDef *)(hdma_spi1_rx.Instance))->NDTR),
     ( ((DMA_Stream_TypeDef *)(hdma_spi1_rx.Instance))->PAR),
     ( ((DMA_Stream_TypeDef *)(hdma_spi1_rx.Instance))->M0AR),
     ( ((DMA_Stream_TypeDef *)(hdma_spi1_rx.Instance))->M1AR),
     ( ((DMA_Stream_TypeDef *)(hdma_spi1_rx.Instance))->FCR)

      );
  Serial.println(print_buf);
  sprintf(print_buf, "RX I DMAMUX registers: CCR=0x%x, RGCR=0x%x",
    hdma_spi1_rx.DMAmuxChannel->CCR,
    hdma_spi1_rx.DMAmuxRequestGen->RGCR);
  Serial.println(print_buf);

}
*/

/*
void SX1257Class::print_rx_iq_data(bool long_run) 
{
  int i_left = __HAL_DMA_GET_COUNTER(&hdma_spi1_rx);
  int q_left = __HAL_DMA_GET_COUNTER(&hdma_spi2_rx);
  int i_index = 0;
  int q_index = 0;
  uint32_t i_val = 0;
  uint32_t q_val = 0;
  char print_buf[128];
  sprintf(print_buf,"Print RX IQ data, i_left=%d q_left=%d\r\n", i_left, q_left);
  Serial.print(print_buf);

  Serial.print("RX Q/I values:");
  for ( int i = 0; i < IQ_BUFFER_SIZE; i++ ) {
    // left is how many are left to be transferred
    // so if 100 are left, IQ_BUFFER_SIZE - 100 - 1 were transferred , so "oldest" 
    // starts at IQ_BUFFER_SIZE - 100 , start printing from there....off by 1???

    if ( i % 5 == 0 ) {
      Serial.println("");
      sprintf(print_buf, "IQDAT%08d:", i);
      Serial.print(print_buf);
    }    
    if ( long_run ) {
      i_val = I_rxBuffer[ (IQ_BUFFER_SIZE - i_left + i) % IQ_BUFFER_SIZE ];
      q_val = Q_rxBuffer[ (IQ_BUFFER_SIZE - q_left + i) % IQ_BUFFER_SIZE ];
    } else {
      i_val = I_rxBuffer[ i ];
      q_val = Q_rxBuffer[ i ];
    }
    sprintf(print_buf, "Q=0x%08x I=0x%08x = %d, ", q_val, i_val, calc_ampl(i_val, q_val) );
    Serial.print(print_buf);
  }
  Serial.println("");
}

void SX1257Class::debug_dfsdm() {

  // assume the DMA is not running, try taking data from I and passing through DFSDM
  // do the init here as well
  // cant find any good examples online so lots of trial and error



  int i_left = __HAL_DMA_GET_COUNTER(&hdma_spi1_rx);
  uint32_t converted_data = 0;
  int32_t signed_data = 0;
  uint32_t other_data = 0;
  char print_buf[256];

  for ( int j = 0; j < IQ_BUFFER_SIZE - i_left; j++ ) {
    // no DFSDM APIs to just write data to register and trigger conversion????

    // write to channel data register, doing standard mode, 32-bit register, write 16 bits
    hdfsdm_I.Instance->CHDATINR =  convert_spi_to_dfsdm(I_rxBuffer[j]);
    // trigger conversion
    CLEAR_BIT(hdfsdm_filt_I.Instance->FLTCR1, 1<<17);
    SET_BIT(hdfsdm_filt_I.Instance->FLTCR1, 1<<17);
    // wait for conversion, polling
    for ( int i = 0; i < 1000; i++ ) {
      if ( !( hdfsdm_filt_I.Instance->FLTISR & (1<<14) ) ) {
        break; // conversion done
      }
    }
    // get data output
    converted_data = (uint32_t) (hdfsdm_filt_I.Instance->FLTRDATAR >> 8); // 24 bit value, signed
    signed_data = extend_sign_24bit(converted_data);
    sprintf(print_buf, "Convert data %d , 0x%x %d -> 0x%x %d\r\n", j, I_rxBuffer[j], convert_spi_to_dfsdm(I_rxBuffer[j]), converted_data, signed_data);
    Serial.print(print_buf);
    dump_dfsdm_regs();

    
  }

  Serial.print("Done converting data");
}
*/
/*
void SX1257Class::reset_dma_buffers() 
{
  memset((void*)I_rxBuffer, 0, sizeof(I_rxBuffer) );
  memset((void*)Q_rxBuffer, 0, sizeof(Q_rxBuffer) );
  __DSB();
  __ISB();
  __DMB(); // just to guarantee what I read back next is up to date
}
*/



SX1257Class SX1257_SDR;

