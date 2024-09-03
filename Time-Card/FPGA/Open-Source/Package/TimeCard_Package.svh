/**
 * File              : TimeCard_Package.vh
 * License           : GPL-3.0-or-later
 * Author            : Peter Gu <github.com/regymm>
 * Date              : 2024.09.01
 * Last Modified Date: 2024.09.01
 */

typedef enum logic[1:0] {Idle_St, Read_St, Write_St, Resp_St} Axi_AccessState_Type;

typedef enum logic[2:0] { Ro_E, Rw_E, Wo_E, Wc_E, Rc_E, None_E } Axi_RegType_Type;

parameter SecondWidth_Con = 32;
parameter NanosecondWidth_Con = 32;
parameter AdjustmentIntervalWidth_Con = 32;
parameter AdjustmentCountWidth_Con = 8;
parameter SecondNanoseconds_Con = 1000000000;
parameter DriftMulP_Con = 3;
parameter DriftDivP_Con = 4;
parameter DriftMulI_Con = 3;
parameter DriftDivI_Con = 16;
parameter OffsetMulP_Con = 3;
parameter OffsetDivP_Con = 4;
parameter OffsetMulI_Con = 3;
parameter OffsetDivI_Con = 16;
parameter OffsetFactorP_Con = (OffsetMulP_Con * (2 ** 16)) / OffsetDivP_Con;
parameter OffsetFactorI_Con = (OffsetMulI_Con * (2 ** 16)) / OffsetDivI_Con;
parameter DriftFactorP_Con = (DriftMulP_Con * (2 ** 16)) / DriftDivP_Con;
parameter DriftFactorI_Con = (DriftMulI_Con * (2 ** 16)) / DriftDivI_Con;  // AXI related constants
parameter Axi_AddrSize_Con = 32;
parameter Axi_DataSize_Con = 32;
parameter Axi_RespOk_Con = 2'b00;
parameter Axi_RespExOk_Con = 2'b01;
parameter Axi_RespSlvErr_Con = 2'b10;
parameter Axi_RespDecErr_Con = 2'b11;

parameter Axi_AccessState_Type_Rst_Con = Idle_St;
parameter Axi_RegType_Type_Rst_Con = None_E;

typedef struct packed {
	logic [Axi_AddrSize_Con-1:0] Addr;
	logic [Axi_DataSize_Con-1:0] Mask;
	Axi_RegType_Type RegType;
	logic [Axi_DataSize_Con-1:0] Reset;
} Axi_Reg_Type;

task Axi_Init_Proc (
	input Axi_Reg_Type RegDef,
	output [Axi_DataSize_Con-1:0]Reg
);
	Reg <= RegDef.Reset & RegDef.Mask;
endtask

task Axi_Read_Proc(
	input Axi_Reg_Type RegDef,
	inout [Axi_DataSize_Con-1:0] Reg,
	input [Axi_AddrSize_Con-1:0] Address,
	output [Axi_DataSize_Con-1:0] Data,
	output [1:0] Result
);
	Reg <= Reg;
	if (RegDef.Addr == Address) begin
		// Read and clear if Rc, not masked bits return 0
		Data <= RegDef.Mask & Reg;
		if (RegDef.Mask & RegDef.RegType == Rc_E)
			Reg <= Reg & ~RegDef.Mask; // If Mask[i] is 1, the Reg[i] bit is set to 0
		// Result (unsure what happens when no mask)
		if (RegDef.Mask & (RegDef.RegType == Rw_E || RegDef.RegType == Wc_E || RegDef.RegType == Ro_E || RegDef.RegType == Rc_E)) Result <= Axi_RespOk_Con;
		else Result <= Axi_RespSlvErr_Con;
	end
endtask

task Axi_Write_Proc(
	input Axi_Reg_Type RegDef,
	inout [Axi_DataSize_Con-1:0] Reg,
	input [Axi_AddrSize_Con-1:0] Address,
	input [Axi_DataSize_Con-1:0] Data,
	output [1:0] Result
);
	Reg <= Reg;
	if (RegDef.Addr == Address) begin
		// Write or clear if Wc, not masked bits unchanged
		if (RegDef.Mask & (RegDef.RegType == Wc_E))
			Reg <= (Reg & ~RegDef.Mask)|(Reg & RegDef.Mask & (~Data));
		else Reg <= (Reg & ~RegDef.Mask)|(Data & RegDef.Mask);
		// Result
		if (RegDef.Mask & (RegDef.RegType == Rw_E || RegDef.RegType == Wo_E || RegDef.RegType == Wc_E)) Result <= Axi_RespOk_Con;
		else Result <= Axi_RespSlvErr_Con;
	end
endtask

