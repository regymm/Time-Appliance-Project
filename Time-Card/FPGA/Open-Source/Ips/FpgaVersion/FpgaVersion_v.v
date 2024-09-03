module FpgaVersion_v #(
	parameter [15:0] VersionNumber_Gen=16'h0000,
	parameter [15:0] VersionNumber_Golden_Gen=16'h0000
)(
	input wire SysClk_ClkIn,
	input wire SysRstN_RstIn,
	(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset_rtl RST" *)
	input wire GoldenImageN_EnaIn,
	//input wire AxiWriteAddrValid_ValIn,
	//output wire AxiWriteAddrReady_RdyOut,
	//input wire [11:0] AxiWriteAddrAddress_AdrIn,
	//input wire [2:0] AxiWriteAddrProt_DatIn,
	//input wire AxiWriteDataValid_ValIn,
	//output wire AxiWriteDataReady_RdyOut,
	//input wire [31:0] AxiWriteDataData_DatIn,
	//input wire [3:0] AxiWriteDataStrobe_DatIn,
	//output wire AxiWriteRespValid_ValOut,
	//input wire AxiWriteRespReady_RdyIn,
	//output wire [1:0] AxiWriteRespResponse_DatOut,
	//input wire AxiReadAddrValid_ValIn,
	//output wire AxiReadAddrReady_RdyOut,
	//input wire [11:0] AxiReadAddrAddress_AdrIn,
	//input wire [2:0] AxiReadAddrProt_DatIn,
	//output wire AxiReadDataValid_ValOut,
	//input wire AxiReadDataReady_RdyIn,
	//output wire [1:0] AxiReadDataResponse_DatOut,
	//output wire [31:0] AxiReadDataData_DatOut
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4l_slave AWVALID" *)
	input wire AxiWriteAddrValid_ValIn,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4l_slave AWREADY" *)
	output wire AxiWriteAddrReady_RdyOut,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4l_slave AWADDR" *)
	input wire [15:0] AxiWriteAddrAddress_AdrIn,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4l_slave AWPROT" *)
	input wire [2:0] AxiWriteAddrProt_DatIn,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4l_slave WVALID" *)
	input wire AxiWriteDataValid_ValIn,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4l_slave WREADY" *)
	output wire AxiWriteDataReady_RdyOut,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4l_slave WDATA" *)
	input wire [31:0] AxiWriteDataData_DatIn,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4l_slave WSTRB" *)
	input wire [3:0] AxiWriteDataStrobe_DatIn,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4l_slave BVALID" *)
	output wire AxiWriteRespValid_ValOut,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4l_slave BREADY" *)
	input wire AxiWriteRespReady_RdyIn,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4l_slave BRESP" *)
	output wire [1:0] AxiWriteRespResponse_DatOut,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4l_slave ARVALID" *)
	input wire AxiReadAddrValid_ValIn,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4l_slave ARREADY" *)
	output wire AxiReadAddrReady_RdyOut,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4l_slave ARADDR" *)
	input wire [15:0] AxiReadAddrAddress_AdrIn,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4l_slave ARPROT" *)
	input wire [2:0] AxiReadAddrProt_DatIn,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4l_slave RVALID" *)
	output wire AxiReadDataValid_ValOut,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4l_slave RREADY" *)
	input wire AxiReadDataReady_RdyIn,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4l_slave RRESP" *)
	output wire [1:0] AxiReadDataResponse_DatOut,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4l_slave RDATA" *)
	output wire [31:0] AxiReadDataData_DatOut
);
FpgaVersion#(
.VersionNumber_Gen(VersionNumber_Gen),
.VersionNumber_Golden_Gen(VersionNumber_Golden_Gen)
)FpgaVersion_inst(
.SysClk_ClkIn(SysClk_ClkIn),
.SysRstN_RstIn(SysRstN_RstIn),
.GoldenImageN_EnaIn(GoldenImageN_EnaIn),
.AxiWriteAddrValid_ValIn(AxiWriteAddrValid_ValIn),
.AxiWriteAddrReady_RdyOut(AxiWriteAddrReady_RdyOut),
.AxiWriteAddrAddress_AdrIn(AxiWriteAddrAddress_AdrIn),
.AxiWriteAddrProt_DatIn(AxiWriteAddrProt_DatIn),
.AxiWriteDataValid_ValIn(AxiWriteDataValid_ValIn),
.AxiWriteDataReady_RdyOut(AxiWriteDataReady_RdyOut),
.AxiWriteDataData_DatIn(AxiWriteDataData_DatIn),
.AxiWriteDataStrobe_DatIn(AxiWriteDataStrobe_DatIn),
.AxiWriteRespValid_ValOut(AxiWriteRespValid_ValOut),
.AxiWriteRespReady_RdyIn(AxiWriteRespReady_RdyIn),
.AxiWriteRespResponse_DatOut(AxiWriteRespResponse_DatOut),
.AxiReadAddrValid_ValIn(AxiReadAddrValid_ValIn),
.AxiReadAddrReady_RdyOut(AxiReadAddrReady_RdyOut),
.AxiReadAddrAddress_AdrIn(AxiReadAddrAddress_AdrIn),
.AxiReadAddrProt_DatIn(AxiReadAddrProt_DatIn),
.AxiReadDataValid_ValOut(AxiReadDataValid_ValOut),
.AxiReadDataReady_RdyIn(AxiReadDataReady_RdyIn),
.AxiReadDataResponse_DatOut(AxiReadDataResponse_DatOut),
.AxiReadDataData_DatOut(AxiReadDataData_DatOut)
);
endmodule
