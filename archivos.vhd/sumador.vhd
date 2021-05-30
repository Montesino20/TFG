----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.02.2021 11:22:45
-- Design Name: 
-- Module Name: sumador - Behavioral
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

entity sumador is
    Port ( sum_1 : in SIGNED (15 downto 0):= "0000000000000000";
           sum_2 : in SIGNED (15 downto 0);
       --    clk : in STD_LOGIC;
           suma : out SIGNED (15 downto 0));
end sumador;

architecture Behavioral of sumador is

begin
--process (clk)
--begin
--    if (clk ='1') then
suma <= sum_1 + sum_2;
--end if;
--end process;
end Behavioral;
