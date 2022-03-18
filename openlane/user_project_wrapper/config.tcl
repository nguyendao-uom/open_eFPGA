# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0

set script_dir [file dirname [file normalize [info script]]]
source $::env(CARAVEL_ROOT)/openlane/user_project_wrapper/fixed_wrapper_cfgs.tcl
source $::env(CARAVEL_ROOT)/openlane/user_project_wrapper/default_wrapper_cfgs.tcl

set ::env(DESIGN_NAME) user_project_wrapper

set ::env(FP_PDN_CHECK_NODES) 0
set ::env(FP_PDN_ENABLE_RAILS) 1 

set ::env(GLB_RT_OBS) "met1 0 0 $::env(DIE_AREA),\
				   met2 0 0 $::env(DIE_AREA),\
				   met3 0 0 $::env(DIE_AREA),\
				   met4 0 0 $::env(DIE_AREA),\
				   met5 0 0 $::env(DIE_AREA)"

set ::env(CLOCK_PORT) "user_clock2"
set ::env(CLOCK_NET) "inst_eFPGA_top.user_clock2"

set ::env(CLOCK_PERIOD) "40"

set ::env(PL_OPENPHYSYN_OPTIMIZATIONS) 0
set ::env(DIODE_INSERTION_STRATEGY) 5

set ::env(MAGIC_WRITE_FULL_LEF) 0

set ::env(SYNTH_FLAT_TOP) 1
set ::env(CLOCK_TREE_SYNTH) 1
set ::env(DESIGN_IS_CORE) 1
#set ::env(FP_PDN_CORE_RING) 1
set ::env(STA_REPORT_POWER) 0
set ::env(SYNTH_USE_PG_PINS_DEFINES) "USE_POWER_PINS"
set ::env(VDD_NETS) {vccd1 vdda1 vdda2 vccd2}
set ::env(GND_NETS) {vssd1 vssa1 vssa2 vssd2}
set ::env(VDD_PIN) "vccd1"
set ::env(GND_PIN) "vssd1"
set ::env(PL_TARGET_DENSITY) 0.45
set ::env(PL_SKIP_INITIAL_PLACEMENT) 1
set ::env(CTS_TARGET_SKEW) 200
set ::env(CTS_SINK_CLUSTERING_SIZE) 100
set ::env(CTS_SINK_CLUSTERING_MAX_DIAMETER) 1000
set ::env(ROUTING_CORES) 12
set ::env(GLB_RT_MAXLAYER) 5
set ::env(FP_PDN_CHECK_NODES) 0
set ::env(RUN_KLAYOUT_XOR) 0
set ::env(KLAYOUT_XOR_GDS) 0
set ::env(KLAYOUT_XOR_XML) 0
set ::env(FP_PDN_IRDROP) 0

#set ::env(PL_MAX_DISPLACEMENT_X) 800
#set ::env(PL_MAX_DISPLACEMENT_Y) 600
set ::env(FP_TAP_HORIZONTAL_HALO) 20
set ::env(FP_TAP_VERTICAL_HALO) 20
set ::env(FP_PDN_HORIZONTAL_HALO) 30
set ::env(FP_PDN_VERTICAL_HALO) 30
#set ::env(FP_PDN_VOFFSET) 5
#set ::env(FP_PDN_HOFFSET) 235
set ::env(FP_PDN_VWIDTH) 1.6
#set ::env(FP_PDN_HSPACING) 15.5
#set ::env(FP_PDN_HSPACING) 3
set ::env(FP_PDN_VPITCH) 2800
#set ::env(FP_PDN_HPITCH) {2800}
#set ::env(PL_MACRO_CHANNEL) {5 30}
#set ::env(PL_MACRO_HALO) {5 30}
#set ::env(FP_PDN_HPITCH) {180}
#set ::env(FP_PDN_VPITCH) {2800}

set ::env(SYNTH_READ_BLACKBOX_LIB) 1
set ::env(VERILOG_FILES) [glob $script_dir/../../verilog/rtl/defines.v $script_dir/../../../verilog/rtl/*.v ]

## Internal Macros
### Macro Placement
set ::env(MACRO_PLACEMENT_CFG) "$script_dir/../../../openlane/user_project_wrapper/macros/placements/macro_placement.cfg"

### Black-box verilog and views
set ::env(VERILOG_FILES_BLACKBOX) [glob $script_dir/../../../verilog/rtl/BB/*.v]

set ::env(EXTRA_LEFS) [glob $script_dir/../../../openlane/user_project_wrapper/macros/lef/*.lef]

set ::env(EXTRA_GDS_FILES) [glob $script_dir/../../../openlane/user_project_wrapper/macros/gds/*.gds]

### Macro PDN Connections
set ::env(FP_PDN_MACRO_HOOKS) "\
        inst_eFPGA_top.Inst_eFPGA.Tile_X0Y1_W_IO vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X0Y2_W_IO vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X0Y3_W_IO vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X0Y4_W_IO vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X0Y5_W_IO vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X0Y6_W_IO vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X0Y7_W_IO vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X0Y8_W_IO vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X0Y9_W_IO vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X0Y10_W_IO vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X0Y11_W_IO vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X0Y12_W_IO vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X1Y0_N_term_single vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X1Y1_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X1Y2_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X1Y3_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X1Y4_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X1Y5_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X1Y6_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X1Y7_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X1Y8_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X1Y9_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X1Y10_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X1Y11_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X1Y12_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X1Y13_S_term_single vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X2Y0_N_term_single vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X2Y1_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X2Y2_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X2Y3_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X2Y4_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X2Y5_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X2Y6_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X2Y7_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X2Y8_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X2Y9_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X2Y10_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X2Y11_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X2Y12_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X2Y13_S_term_single vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X3Y0_N_term_single2 vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X3Y1_RegFile vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X3Y2_RegFile vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X3Y3_RegFile vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X3Y4_RegFile vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X3Y5_RegFile vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X3Y6_RegFile vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X3Y7_RegFile vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X3Y8_RegFile vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X3Y9_RegFile vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X3Y10_RegFile vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X3Y11_RegFile vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X3Y12_RegFile vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X3Y13_S_term_single2 vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X4Y0_N_term_single vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X4Y1_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X4Y2_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X4Y3_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X4Y4_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X4Y5_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X4Y6_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X4Y7_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X4Y8_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X4Y9_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X4Y10_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X4Y11_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X4Y12_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X4Y13_S_term_single vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X5Y0_N_term_single vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X5Y1_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X5Y2_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X5Y3_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X5Y4_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X5Y5_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X5Y6_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X5Y7_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X5Y8_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X5Y9_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X5Y10_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X5Y11_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X5Y12_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X5Y13_S_term_single vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X6Y0_N_term_DSP vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X6Y1_X6Y2_DSP_tile vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X6Y3_X6Y4_DSP_tile vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X6Y5_X6Y6_DSP_tile vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X6Y7_X6Y8_DSP_tile vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X6Y9_X6Y10_DSP_tile vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X6Y11_X6Y12_DSP_tile vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X6Y13_S_term_DSP vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X7Y0_N_term_single vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X7Y1_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X7Y2_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X7Y3_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X7Y4_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X7Y5_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X7Y6_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X7Y7_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X7Y8_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X7Y9_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X7Y10_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X7Y11_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X7Y12_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X7Y13_S_term_single vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X8Y0_N_term_single vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X8Y1_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X8Y2_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X8Y3_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X8Y4_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X8Y5_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X8Y6_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X8Y7_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X8Y8_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X8Y9_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X8Y10_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X8Y11_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X8Y12_LUT4AB vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X8Y13_S_term_single vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X9Y0_N_term_RAM_IO vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X9Y1_RAM_IO vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X9Y2_RAM_IO vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X9Y3_RAM_IO vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X9Y4_RAM_IO vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X9Y5_RAM_IO vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X9Y6_RAM_IO vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X9Y7_RAM_IO vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X9Y8_RAM_IO vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X9Y9_RAM_IO vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X9Y10_RAM_IO vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X9Y11_RAM_IO vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X9Y12_RAM_IO vccd1 vssd1 \
        inst_eFPGA_top.Inst_eFPGA.Tile_X9Y13_S_term_RAM_IO vccd1 vssd1 \
        inst_eFPGA_top.Inst_BlockRAM_5 vccd1 vssd1 \
        inst_eFPGA_top.Inst_BlockRAM_4 vccd1 vssd1 \
        inst_eFPGA_top.Inst_BlockRAM_3 vccd1 vssd1 \
        inst_eFPGA_top.Inst_BlockRAM_2 vccd1 vssd1 \
        inst_eFPGA_top.Inst_BlockRAM_1 vccd1 vssd1 \
        inst_eFPGA_top.Inst_BlockRAM_0 vccd1 vssd1 "

