----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.03.2021 16:48:24
-- Design Name: 
-- Module Name: RegistroUno - Behavioral
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

entity RegistroUno is
    Port ( D : in SIGNED (7 downto 0);
           clk: in STD_LOGIC;
           reset : in STD_LOGIC;
           Q : out SIGNED (7 downto 0));
end RegistroUno;

architecture Behavioral of RegistroUno is

begin
process (clk)
    begin
    
        if (rising_edge(clk)) then
            if (reset = '1') then
                Q<="00000000";
                else
            Q <= D;
            end if;
            end if;
      end process;

end Behavioral;
