----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.03.2021 19:40:46
-- Design Name: 
-- Module Name: registroT1 - Behavioral
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

entity registroT1 is
 Port ( D : in SIGNED (15 downto 0);
          clk : in STD_LOGIC;
          reset : in STD_LOGIC;
          cont : in SIGNED (1 downto 0);
          Q : out SIGNED (15 downto 0));
end registroT1;

architecture Behavioral of registroT1 is

begin
process (clk)
    begin
    
        if (rising_edge(clk)) then
            if (reset = '1') then
                Q<="0000000000000000";
                 
             elsif (cont ="01") then
                    Q <= D;
            end if;
         end if;
      end process;

end Behavioral;
