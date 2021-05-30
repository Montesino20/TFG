----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.03.2021 16:55:24
-- Design Name: 
-- Module Name: registroDos - Behavioral
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

entity registroDos is
    Port ( reg2_in : in SIGNED (15 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           reg2_out : out SIGNED (15 downto 0));
end registroDos;

architecture Behavioral of registroDos is
signal ciclo2 : SIGNED (1 downto 0) := "00";
signal aux2 : SIGNED (15 downto 0) := "0000000000000000";
begin
process (clk)
    begin
        if rising_edge(clk) then
                 
                 if (ciclo2 = "01") then
                     aux2 <= reg2_in;
                  end if;
                ciclo2<= ciclo2+1;
                if (reset = '1') then
                    reg2_out <= "0000000000000000";
                    ciclo2 <="00";
                end if;
                
                if (ciclo2 = "11") then
                   reg2_out <= aux2;
                   ciclo2 <="00"; 
                end if;
        end if;
end process;

end Behavioral;
