----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.04.2021 11:54:00
-- Design Name: 
-- Module Name: DisSmall - Behavioral
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


entity disSmall is
    Port ( disruptor : in STD_LOGIC_VECTOR (7 downto 0);
           sig : in SIGNED (7 downto 0);
           salida : out SIGNED (7 downto 0));
end disSmall;

architecture Behavioral of disSmall is

begin
salida <= signed(disruptor) XOR sig;

end Behavioral;