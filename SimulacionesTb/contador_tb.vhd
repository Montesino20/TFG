----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.03.2021 19:12:32
-- Design Name: 
-- Module Name: contador_tb - Behavioral
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

entity contador_tb is
--  Port ( );
end contador_tb;

architecture Behavioral of contador_tb is
component contador 
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           output : inout SIGNED (1 downto 0));
end component;
signal clk, reset : STD_LOGIC;
signal output : SIGNED (1 downto 0);
constant DELTA : time := 100 ns;
constant clk_period : time := 100 ns;
begin
DUT : contador
        port map(
            clk => clk,
            reset => reset,
            output => output);
            
clk_process :  process
                    begin
                        clk <= '0';
                        wait for clk_period/2;
                        clk <= '1';
                        wait for clk_period/2;
                    end process;
process
                    begin
                  reset <= '1';--0
                  wait for DELTA ;
                  reset <= '0';
                  wait for DELTA;
                  reset <= '0';
                  wait for DELTA;
                  reset <= '0';--0
                  wait for 10 ns;
                  reset <= '0';
                  wait for DELTA;
                  reset <= '0';
                  wait for DELTA;
               wait;
           end process;
end Behavioral;
