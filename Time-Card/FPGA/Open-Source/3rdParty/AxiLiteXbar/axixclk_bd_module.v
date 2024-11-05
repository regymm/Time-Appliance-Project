module axixclk_v #(
	// {{{
	parameter integer C_S_AXI_ID_WIDTH	= 2,
	parameter integer C_S_AXI_DATA_WIDTH	= 32,
	parameter integer C_S_AXI_ADDR_WIDTH	= 6,
	// Some useful short-hand definitions
	// localparam	AW = C_S_AXI_ADDR_WIDTH,
	// localparam	DW = C_S_AXI_DATA_WIDTH,
	// localparam	IW = C_S_AXI_ID_WIDTH,
	//
	parameter [0:0]	OPT_WRITE_ONLY = 1'b0,
	parameter [0:0]	OPT_READ_ONLY = 1'b0,
	parameter	XCLOCK_FFS = 2,
	parameter	LGFIFO = 5
	// }}}
) (
	// {{{
	// Users to add ports here

	// User ports ends
	// Do not modify the ports beyond this line

	(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_clk, ASSOCIATED_BUSIF s_axi ASSOCIATED_RESET s_axi_aresetn" *)
	(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axi_clk CLK" *)
	input	wire				S_AXI_ACLK,
	(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s_axi_aresetn RST" *)
	input	wire				S_AXI_ARESETN,
	//
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWID" *)
	input	wire [C_S_AXI_ID_WIDTH-1 : 0]	S_AXI_AWID,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWADDR" *)
	input	wire [C_S_AXI_ADDR_WIDTH-1 : 0]	S_AXI_AWADDR,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWLEN" *)
	input	wire [7 : 0]			S_AXI_AWLEN,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWSIZE" *)
	input	wire [2 : 0]			S_AXI_AWSIZE,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWBURST" *)
	input	wire [1 : 0]			S_AXI_AWBURST,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWLOCK" *)
	input	wire				S_AXI_AWLOCK,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWCACHE" *)
	input	wire [3 : 0]			S_AXI_AWCACHE,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWPROT" *)
	input	wire [2 : 0]			S_AXI_AWPROT,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWQOS" *)
	input	wire [3 : 0]			S_AXI_AWQOS,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWVALID" *)
	input	wire				S_AXI_AWVALID,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWREADY" *)
	output	wire				S_AXI_AWREADY,
	//
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WDATA" *)
	input	wire [C_S_AXI_DATA_WIDTH-1 : 0]	S_AXI_WDATA,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WSTRB" *)
	input	wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WLAST" *)
	input	wire				S_AXI_WLAST,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WVALID" *)
	input	wire				S_AXI_WVALID,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WREADY" *)
	output	wire				S_AXI_WREADY,
	//
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BID" *)
	output	wire [C_S_AXI_ID_WIDTH-1 : 0]	S_AXI_BID,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BRESP" *)
	output	wire [1 : 0]			S_AXI_BRESP,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BVALID" *)
	output	wire				S_AXI_BVALID,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BREADY" *)
	input	wire				S_AXI_BREADY,
	//
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARID" *)
	input	wire [C_S_AXI_ID_WIDTH-1 : 0]	S_AXI_ARID,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARADDR" *)
	input	wire [C_S_AXI_ADDR_WIDTH-1 : 0]	S_AXI_ARADDR,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARLEN" *)
	input	wire [7 : 0]			S_AXI_ARLEN,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARSIZE" *)
	input	wire [2 : 0]			S_AXI_ARSIZE,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARBURST" *)
	input	wire [1 : 0]			S_AXI_ARBURST,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARLOCK" *)
	input	wire				S_AXI_ARLOCK,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARCACHE" *)
	input	wire [3 : 0]			S_AXI_ARCACHE,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARPROT" *)
	input	wire [2 : 0]			S_AXI_ARPROT,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARQOS" *)
	input	wire [3 : 0]			S_AXI_ARQOS,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARVALID" *)
	input	wire				S_AXI_ARVALID,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARREADY" *)
	output	wire				S_AXI_ARREADY,
	//
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RID" *)
	output	wire [C_S_AXI_ID_WIDTH-1 : 0]	S_AXI_RID,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RDATA" *)
	output	wire [C_S_AXI_DATA_WIDTH-1 : 0]	S_AXI_RDATA,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RRESP" *)
	output	wire [1 : 0]			S_AXI_RRESP,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RLAST" *)
	output	wire				S_AXI_RLAST,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RVALID" *)
	output	wire				S_AXI_RVALID,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RREADY" *)
	input	wire				S_AXI_RREADY,
	//
	//	Downstream port
	//
	(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_clk, ASSOCIATED_BUSIF m_axi ASSOCIATED_RESET m_axi_aresetn" *)
	(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 m_axi_clk CLK" *)
	input	wire				M_AXI_ACLK,
	(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 m_axi_aresetn RST" *)
	output	wire				M_AXI_ARESETN,
	//
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWID" *)
	output	wire [C_S_AXI_ID_WIDTH-1 : 0]	M_AXI_AWID,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWADDR" *)
	output	wire [C_S_AXI_ADDR_WIDTH-1 : 0]	M_AXI_AWADDR,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWLEN" *)
	output	wire [7 : 0]			M_AXI_AWLEN,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWSIZE" *)
	output	wire [2 : 0]			M_AXI_AWSIZE,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWBURST" *)
	output	wire [1 : 0]			M_AXI_AWBURST,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWLOCK" *)
	output	wire				M_AXI_AWLOCK,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWCACHE" *)
	output	wire [3 : 0]			M_AXI_AWCACHE,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWPROT" *)
	output	wire [2 : 0]			M_AXI_AWPROT,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWQOS" *)
	output	wire [3 : 0]			M_AXI_AWQOS,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWVALID" *)
	output	wire				M_AXI_AWVALID,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWREADY" *)
	input	wire				M_AXI_AWREADY,
	//
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi WDATA" *)
	output	wire [C_S_AXI_DATA_WIDTH-1 : 0]	M_AXI_WDATA,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi WSTRB" *)
	output	wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] M_AXI_WSTRB,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi WLAST" *)
	output	wire				M_AXI_WLAST,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi WVALID" *)
	output	wire				M_AXI_WVALID,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi WREADY" *)
	input	wire				M_AXI_WREADY,
	//
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi BID" *)
	input	wire [C_S_AXI_ID_WIDTH-1 : 0]	M_AXI_BID,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi BRESP" *)
	input	wire [1 : 0]			M_AXI_BRESP,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi BVALID" *)
	input	wire				M_AXI_BVALID,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi BREADY" *)
	output	wire				M_AXI_BREADY,
	//
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARID" *)
	output	wire [C_S_AXI_ID_WIDTH-1 : 0]	M_AXI_ARID,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARADDR" *)
	output	wire [C_S_AXI_ADDR_WIDTH-1 : 0]	M_AXI_ARADDR,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARLEN" *)
	output	wire [7 : 0]			M_AXI_ARLEN,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARSIZE" *)
	output	wire [2 : 0]			M_AXI_ARSIZE,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARBURST" *)
	output	wire [1 : 0]			M_AXI_ARBURST,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARLOCK" *)
	output	wire				M_AXI_ARLOCK,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARCACHE" *)
	output	wire [3 : 0]			M_AXI_ARCACHE,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARPROT" *)
	output	wire [2 : 0]			M_AXI_ARPROT,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARQOS" *)
	output	wire [3 : 0]			M_AXI_ARQOS,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARVALID" *)
	output	wire				M_AXI_ARVALID,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARREADY" *)
	input	wire				M_AXI_ARREADY,
	//
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi RID" *)
	input	wire [C_S_AXI_ID_WIDTH-1 : 0]	M_AXI_RID,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi RDATA" *)
	input	wire [C_S_AXI_DATA_WIDTH-1 : 0]	M_AXI_RDATA,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi RRESP" *)
	input	wire [1 : 0]			M_AXI_RRESP,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi RLAST" *)
	input	wire				M_AXI_RLAST,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi RVALID" *)
	input	wire				M_AXI_RVALID,
	(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi RREADY" *)
	output	wire				M_AXI_RREADY
	// }}}
	);
	axixclk #(
		.C_S_AXI_ID_WIDTH	(C_S_AXI_ID_WIDTH	),
		.C_S_AXI_DATA_WIDTH	(C_S_AXI_DATA_WIDTH	),
		.C_S_AXI_ADDR_WIDTH	(C_S_AXI_ADDR_WIDTH	),
		.OPT_WRITE_ONLY(OPT_WRITE_ONLY),
		.OPT_READ_ONLY(OPT_READ_ONLY),
		.XCLOCK_FFS(XCLOCK_FFS),
		.LGFIFO(LGFIFO)
	)
	axixclk_inst(
		.S_AXI_ACLK(S_AXI_ACLK),
		.S_AXI_ARESETN(S_AXI_ARESETN),
		.S_AXI_AWID(S_AXI_AWID),
		.S_AXI_AWADDR(S_AXI_AWADDR),
		.S_AXI_AWLEN(S_AXI_AWLEN),
		.S_AXI_AWSIZE(S_AXI_AWSIZE),
		.S_AXI_AWBURST(S_AXI_AWBURST),
		.S_AXI_AWLOCK(S_AXI_AWLOCK),
		.S_AXI_AWCACHE(S_AXI_AWCACHE),
		.S_AXI_AWPROT(S_AXI_AWPROT),
		.S_AXI_AWQOS(S_AXI_AWQOS),
		.S_AXI_AWVALID(S_AXI_AWVALID),
		.S_AXI_AWREADY(S_AXI_AWREADY),
		.S_AXI_WDATA(S_AXI_WDATA),
		.S_AXI_WSTRB(S_AXI_WSTRB),
		.S_AXI_WLAST(S_AXI_WLAST),
		.S_AXI_WVALID(S_AXI_WVALID),
		.S_AXI_WREADY(S_AXI_WREADY),
		.S_AXI_BID(S_AXI_BID),
		.S_AXI_BRESP(S_AXI_BRESP),
		.S_AXI_BVALID(S_AXI_BVALID),
		.S_AXI_BREADY(S_AXI_BREADY),
		.S_AXI_ARID(S_AXI_ARID),
		.S_AXI_ARADDR(S_AXI_ARADDR),
		.S_AXI_ARLEN(S_AXI_ARLEN),
		.S_AXI_ARSIZE(S_AXI_ARSIZE),
		.S_AXI_ARBURST(S_AXI_ARBURST),
		.S_AXI_ARLOCK(S_AXI_ARLOCK),
		.S_AXI_ARCACHE(S_AXI_ARCACHE),
		.S_AXI_ARPROT(S_AXI_ARPROT),
		.S_AXI_ARQOS(S_AXI_ARQOS),
		.S_AXI_ARVALID(S_AXI_ARVALID),
		.S_AXI_ARREADY(S_AXI_ARREADY),
		.S_AXI_RID(S_AXI_RID),
		.S_AXI_RDATA(S_AXI_RDATA),
		.S_AXI_RRESP(S_AXI_RRESP),
		.S_AXI_RLAST(S_AXI_RLAST),
		.S_AXI_RVALID(S_AXI_RVALID),
		.S_AXI_RREADY(S_AXI_RREADY),
		.M_AXI_ACLK(M_AXI_ACLK),
		.M_AXI_ARESETN(M_AXI_ARESETN),
		.M_AXI_AWID(M_AXI_AWID),
		.M_AXI_AWADDR(M_AXI_AWADDR),
		.M_AXI_AWLEN(M_AXI_AWLEN),
		.M_AXI_AWSIZE(M_AXI_AWSIZE),
		.M_AXI_AWBURST(M_AXI_AWBURST),
		.M_AXI_AWLOCK(M_AXI_AWLOCK),
		.M_AXI_AWCACHE(M_AXI_AWCACHE),
		.M_AXI_AWPROT(M_AXI_AWPROT),
		.M_AXI_AWQOS(M_AXI_AWQOS),
		.M_AXI_AWVALID(M_AXI_AWVALID),
		.M_AXI_AWREADY(M_AXI_AWREADY),
		.M_AXI_WDATA(M_AXI_WDATA),
		.M_AXI_WSTRB(M_AXI_WSTRB),
		.M_AXI_WLAST(M_AXI_WLAST),
		.M_AXI_WVALID(M_AXI_WVALID),
		.M_AXI_WREADY(M_AXI_WREADY),
		.M_AXI_BID(M_AXI_BID),
		.M_AXI_BRESP(M_AXI_BRESP),
		.M_AXI_BVALID(M_AXI_BVALID),
		.M_AXI_BREADY(M_AXI_BREADY),
		.M_AXI_ARID(M_AXI_ARID),
		.M_AXI_ARADDR(M_AXI_ARADDR),
		.M_AXI_ARLEN(M_AXI_ARLEN),
		.M_AXI_ARSIZE(M_AXI_ARSIZE),
		.M_AXI_ARBURST(M_AXI_ARBURST),
		.M_AXI_ARLOCK(M_AXI_ARLOCK),
		.M_AXI_ARCACHE(M_AXI_ARCACHE),
		.M_AXI_ARPROT(M_AXI_ARPROT),
		.M_AXI_ARQOS(M_AXI_ARQOS),
		.M_AXI_ARVALID(M_AXI_ARVALID),
		.M_AXI_ARREADY(M_AXI_ARREADY),
		.M_AXI_RID(M_AXI_RID),
		.M_AXI_RDATA(M_AXI_RDATA),
		.M_AXI_RRESP(M_AXI_RRESP),
		.M_AXI_RLAST(M_AXI_RLAST),
		.M_AXI_RVALID(M_AXI_RVALID),
		.M_AXI_RREADY(M_AXI_RREADY)
	);
endmodule
