----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.03.2021 13:01:10
-- Design Name: 
-- Module Name: registro - Behavioral
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

entity registro is
    Port ( reg_in : in SIGNED (15 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           reg_out : out SIGNED (15 downto 0));
end registro;

architecture Behavioral of registro is
signal ciclo : SIGNED (1 downto 0) := "00";
signal aux : SIGNED (15 downto 0) := "0000000000000000";

begin
process (clk)
    begin
        if rising_edge(clk) then
                 
                 if (ciclo = "00") then
                     aux <= reg_in;
                  end if;
                ciclo<= ciclo+1;
                if (reset = '1') then
                    reg_out <= "0000000000000000";
                    ciclo <="00";
                end if;
                --reg_out <= aux;
                if (ciclo = "11") then
                   reg_out <= aux;
                   ciclo <="00"; 
                end if;
        end if;   
      

end process;      
end Behavioral;
