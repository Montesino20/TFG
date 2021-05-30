----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.03.2021 20:26:00
-- Design Name: 
-- Module Name: sumador_tb - Behavioral
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

entity sumador_tb is
--  Port ( );
end sumador_tb;

architecture Behavioral of sumador_tb is
component sumador 
    Port ( sum_1 : in SIGNED (15 downto 0);
           sum_2 : in SIGNED (15 downto 0);
          -- clk : in STD_LOGIC;
           suma : out SIGNED (15 downto 0));
end component;

signal sum_1, sum_2, suma : SIGNED (15 downto 0);
signal clk : STD_LOGIC;
constant DELTA : time := 100 ns;
constant clk_period : time := 50 ns;
begin

DUT : sumador
        port map(
            sum_1 => sum_1,
            sum_2 => sum_2,
        --    clk=> clk,
            suma => suma);
            
--clk_process :process
--                    begin
--                        clk <= '0';
--                        wait for clk_period/2;
--                        clk <= '1';
--                        wait for clk_period/2;
--                    end process;            
process
begin
            sum_1 <= "0000000000000001";--0
            wait for 10 ns;
            sum_2 <= "0000000000000100";
            wait for DELTA;
            
            sum_1 <= "0000000101000000";--0
            sum_2 <= "0000101000000000";
            wait for DELTA;
         wait;
         end process;   

end Behavioral;
