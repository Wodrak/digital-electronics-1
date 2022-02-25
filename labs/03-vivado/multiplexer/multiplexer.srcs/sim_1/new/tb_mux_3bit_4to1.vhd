------------------------------------------------------------
--
-- Testbench for 2-bit binary comparator.
-- EDA Playground
--
-- Copyright (c) 2020-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity mux_3bit_4to1 is
    -- Entity of testbench is always empty
end entity mux_3bit_4to1;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of mux_3bit_4to1 is

    -- Local signals
    signal s_d           : std_logic_vector(3 - 1 downto 0);
    signal s_c           : std_logic_vector(3 - 1 downto 0);
    signal s_b           : std_logic_vector(3 - 1 downto 0);
    signal s_a           : std_logic_vector(3 - 1 downto 0);
    signal sel_a         : std_logic_vector(2 - 1 downto 0);
    signal s_f           : std_logic;


begin
    -- Connecting testbench signals with comparator_2bit
    -- entity (Unit Under Test)
    uut_mux_3bit_4to1 : entity work.mux_3bit_4to1
        port map(
            d_i           => s_d,
            c_i           => s_c,
            b_i           => s_b,
            a_i           => s_a,
            f_o           => s_f
        );

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;

        -- First test case
        s_a <= "001"; s_b <= "010";s_c <= "011"; s_d <= "100";
        sel_a <= "00";wait for 100 ns;
        sel_a <= "01";wait for 100 ns;
        sel_a <= "10";wait for 100 ns;
        sel_a <= "11";wait for 100 ns;



        -- WRITE OTHER TEST CASES HERE



        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;
