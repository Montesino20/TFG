----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.03.2021 20:39:57
-- Design Name: 
-- Module Name: RegistroUno_tb - Behavioral
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

entity RegistroUno_tb is
--  Port ( );
end RegistroUno_tb;

architecture Behavioral of RegistroUno_tb is
component RegistroUno 
    Port ( D : in SIGNED (7 downto 0);
           clk: in STD_LOGIC;
           reset : in STD_LOGIC;
           Q : out SIGNED (7 downto 0));
end component;
--input signals declaration
signal D : SIGNED(7 downto 0);
signal clk, reset: STD_LOGIC;
--output signals declaration
signal Q: SIGNED(7 downto 0);


constant DELTA : time := 150 ns;
constant clk_period : time := 50 ns;

begin
DUT : RegistroUno
        port map(
            D => D,
            clk => clk,
            reset => reset,
            Q => Q);

clk_process :process
        begin
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end process;
process
                begin
                        D <= "10010001";--0

                        wait for DELTA;
                        
                     
                        D <= "11110001";--0
                        wait for DELTA;
                        
                        D <= "10010011";--0
                        wait for DELTA; 
                        
                        D <= "10011001";--0
                        wait for DELTA;
                        
                        D <= "10010001";--0
                        wait for DELTA;
                        
                        D <= "00010100";--0
                        wait for DELTA;                
                                       
                        
                        
                        
                wait;
                end process;       
        end Behavioral;

















