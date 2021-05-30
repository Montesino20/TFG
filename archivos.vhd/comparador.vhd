----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.04.2021 09:18:45
-- Design Name: 
-- Module Name: comparador - Behavioral
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

entity comparador is
    Port ( a : in SIGNED (15 downto 0);
           b : in SIGNED (15 downto 0);
           cont : in SIGNED (1 downto 0);
           error : inout SIGNED (10 downto 0):="00000000000" );
end comparador;

architecture Behavioral of comparador is
signal f : STD_LOGIC;
signal aux1  : SIGNED (15 downto 0):="0000000000000000";
signal aux2  : SIGNED (15 downto 0):="0000000000000000";
begin
    process (cont)
    begin
            
             if (cont="00") then
                        aux1 <= a+2;
                         aux2 <= b;
                         
                    if (aux1=aux2)  then 
                                                error<=error;
                                                f<='0';
                                              else
                                                error<=error+1;
                                                f<='1';
                                          end if;   
              end if;
               
              
             
end process;
end Behavioral;
