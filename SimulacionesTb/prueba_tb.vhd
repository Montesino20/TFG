----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.04.2021 21:54:11
-- Design Name: 
-- Module Name: prueba_tb - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity prueba_tb is
--  Port ( );
end prueba_tb;

architecture Behavioral of prueba_tb is
component prueba 
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal a : STD_LOGIC_VECTOR (7 downto 0);
signal b : STD_LOGIC_VECTOR (3 downto 0);
begin
DUT: prueba

        PORT MAP(
         a=>a,
         b=>b
         );
process
 begin 
                a<="00000000";
                wait for 20ns;
                a<="00001000";
                wait for 20ns;
                a<="00001000";
end process;
end Behavioral;
