// SPDX-FileCopyrightText: 
// 2022 Nguyen Dao
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0

module Config_access (C_bit0, C_bit1, C_bit2, C_bit3, ConfigBits);
	parameter NoConfigBits = 4;// has to be adjusted manually (we don't use an arithmetic parser for the value)
	// Pin0
	output C_bit0; // EXTERNAL
	output C_bit1; // EXTERNAL
	output C_bit2; // EXTERNAL
	output C_bit3; // EXTERNAL
	// GLOBAL all primitive pins that are connected to the switch matrix have to go before the GLOBAL label
	input [NoConfigBits-1:0] ConfigBits;

	// we just wire configuration bits to fabric top
	assign C_bit0 = ConfigBits[0];
	assign C_bit1 = ConfigBits[1];
	assign C_bit2 = ConfigBits[2];
	assign C_bit3 = ConfigBits[3];

endmodule
