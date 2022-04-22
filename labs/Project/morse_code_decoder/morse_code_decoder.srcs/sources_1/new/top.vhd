----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.04.2022 19:31:49
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( BTNC : in STD_LOGIC;
           CLK100MHZ : in STD_LOGIC;
           rst : in STD_LOGIC
           
           );
end top;

architecture Behavioral of top is

    signal s_en  : std_logic;
    signal s_cnt : std_logic_vector(4 - 1 downto 0);
    signal s_over_flow : std_logic;
    signal s_shift : std_logic;
    signal s_char : std_logic_vector(3 - 1 downto 0);
    signal s_dcd : std_logic;
    signal s_cnt_rst : std_logic;
begin
  clk_en0 : entity work.clock_enable
      generic map(
          g_MAX => 100000000
      )
      port map(
            clk   => CLK100MHZ,
            reset => rst,
            ce_o  => s_en
      );
   
   bin_cnt0 : entity work.cnt_up_down
     generic map(
            g_CNT_WIDTH  => 4
      )
      port map(
            clk      => CLK100MHZ,
            rst      => rst,
            dec_rst  => s_cnt_rst,
            en_i     => s_en,
            cnt_up_i => '1',
            over_flow_o => s_over_flow,
            cnt_o    => s_cnt
   );
   
   decod : entity work.decoder
      port map(
            clk          => s_en,
            rst          => rst,
            btnc_i       => BTNC,
            over_flow_i  => s_over_flow,
            cnt_i        => s_cnt,
            shift_o      => s_shift,
            char_o	     => s_char,
            dcd_o	     => s_dcd,
            rst_o        => s_cnt_rst
      );

end Behavioral;
