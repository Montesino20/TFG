----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.03.2021 19:04:07
-- Design Name: 
-- Module Name: contador - Behavioral
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

entity contador is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           output : inout SIGNED (1 downto 0));
end contador;

architecture Behavioral of contador is

begin
    process (clk, reset)
        begin
           if (rising_edge(clk)) then
            
                 if (reset = '1' or output = "10") then
                       output <= "00";
                
                 else 
                    output <= output +1;
                 end if;
            end if;
end process;
end Behavioral;
