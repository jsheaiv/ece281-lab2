----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2025 09:34:51 AM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
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

entity sevenseg_decoder_tb is
 -- Port ( );
end sevenseg_decoder_tb;

architecture Behavioral of sevenseg_decoder_tb is

    component sevenseg_decoder is
        port (
        i_hex: in std_logic_vector(3 downto 0);
        o_seg_n: out std_logic_vector (6 downto 0)
        );
    end component;
    
    signal wire_in: std_logic_vector (3 downto 0);
    signal wire_out: std_logic_vector (6 downto 0);
begin
sevenseg_decoder_uut: sevenseg_decoder port map(
    i_hex => wire_in,
    o_seg_n => wire_out
    );    
test_process: process
begin
    wire_in <= "0000"; wait for 10 ns;  -- 0
            assert wire_out = "1000000" report "error on 0" severity failure;
    wire_in <= "0100"; wait for 10 ns;  -- 4
            assert wire_out = "0011001" report "error on 1" severity failure;
    wire_in <= "1000"; wait for 10 ns;  -- 8
            assert wire_out = "0000000" report "error on 2" severity failure; 
    wire_in <= "1010"; wait for 10 ns;  -- A
            assert wire_out = "0001000" report "error on 3" severity failure; 
    wire_in <= "1100"; wait for 10 ns;  -- C
            assert wire_out = "0100111" report "error on 4" severity failure;
    wire_in <= "1111"; wait for 10 ns;  -- F
            assert wire_out = "0001110" report "error on 5" severity failure;
    wait; 
  end process;
end Behavioral;
