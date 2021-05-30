----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.03.2021 17:00:21
-- Design Name: 
-- Module Name: registroDos_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity registroDos_tb is
--  Port ( );
end registroDos_tb;

architecture Behavioral of registroDos_tb is
component registroDos 
    Port ( reg2_in : in SIGNED (15 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           reg2_out : out SIGNED (15 downto 0));
end component;
--input signals declaration
signal reg2_in : SIGNED(15 downto 0);
signal clk, reset: std_logic;
--output signals declaration
signal reg2_out: SIGNED(15 downto 0);
constant DELTA : time := 100 ns;
constant clk_period : time := 50 ns;

begin
DUT : registroDos
        port map(
            reg2_in => reg2_in,
            clk => clk,
            reset=>reset,
            reg2_out => reg2_out);

clk_process :process
        begin
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end process;
process
                begin
                        reg2_in <= "0001000100010001";--0
                        reset<='0';
                        wait for DELTA;
                        
                        reset<='0';
                        reg2_in <= "0000000100010110";--0
                        wait for DELTA;
                        
                        reset<='0';
                        reg2_in <= "0010001000010011";--0
                        wait for DELTA; 
                        
                        reset<='0';
                        reg2_in <= "0100010000010111";--0
                        wait for DELTA;
                        
                        reg2_in <= "1010001000100010";--0
                        wait for DELTA;
                        
                        reg2_in <= "0001000001001000";--0
                        wait for DELTA;                
                                       
                        
                        
                        
                wait;
                end process;         
end Behavioral;
