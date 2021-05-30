----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.04.2021 19:16:19
-- Design Name: 
-- Module Name: dis - Behavioral
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

entity dis is
    Port ( disruptor : in STD_LOGIC_VECTOR (15 downto 0);
           sig : in SIGNED (15 downto 0);
           salida : out SIGNED (15 downto 0));
end dis;

architecture Behavioral of dis is

begin
salida <= signed(disruptor) XOR sig;

end Behavioral;
