----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.05.2021 10:59:24
-- Design Name: 
-- Module Name: wrapper_area_tiempo - Behavioral
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

entity wrapper_area_tiempo is
    Port ( dato1 : in SIGNED (7 downto 0);
           dato2 : in SIGNED (7 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           disruptor : in STD_LOGIC_VECTOR (175 downto 0);
           salida : inout SIGNED (15 downto 0));
end wrapper_area_tiempo;

architecture Behavioral of wrapper_area_tiempo is

component MAC_AreaYTiempo
    Port ( dato1 : in SIGNED (7 downto 0);
           dato2 : in SIGNED (7 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           disruptor : in STD_LOGIC_VECTOR (175 downto 0);
           salida : inout SIGNED  (15 downto 0));
end component;

signal dato1_reg, dato2_reg: SIGNED (7 downto 0);
--signal rst_reg, clk_reg: std_logic;
signal disruptor_reg: STD_LOGIC_VECTOR (175 downto 0);
signal salida_reg, salida_temp: SIGNED  (15 downto 0);


begin

process(clk)
begin
    if (rising_edge(clk)) then
        if(reset='1') then
            dato1_reg <= (others=>'0');
            dato2_reg <= (others=>'0');
            disruptor_reg <= (others=>'0');
            salida_reg <= (others=>'0');
         else
            dato1_reg <= dato1;
            dato2_reg <= dato2;
            disruptor_reg <= disruptor;
            salida_reg <= salida_temp;
         end if;
     end if;
 end process; 
 
 Ins1: MAC_AreaYTiempo port map (dato1 => dato1_reg,
      dato2 =>dato2_reg,
      clk=>clk, 
      reset => reset,
      disruptor =>disruptor_reg,
      salida=>salida_temp);
      
salida <= salida_reg;

end Behavioral;