----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.03.2021 13:12:28
-- Design Name: 
-- Module Name: MAC_Basico - Behavioral
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

entity MAC_Basico is
    Port ( dato1 : in SIGNED (7 downto 0);
           dato2 : in SIGNED (7 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           salida : inout SIGNED (15 downto 0));
end MAC_Basico;

architecture Behavioral of MAC_Basico is
component multiplicador 
    Port ( mult_x : in SIGNED (7 downto 0);
           mult_y : in SIGNED (7 downto 0);
           producto : out SIGNED (15 downto 0));
end component;

component sumador 
    Port ( sum_1 : in SIGNED (15 downto 0);
           sum_2 : in SIGNED (15 downto 0);
           suma : out SIGNED (15 downto 0));
end component;
component registroUnoBig 
    Port ( D : in SIGNED (15 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           Q : out SIGNED (15 downto 0));
end component;
signal mult1, suma : SIGNED (15 downto 0);
begin

G1: multiplicador port map(
            mult_x=>dato1,
            mult_y => dato2,
            producto=>mult1);
            
G2: sumador port map(
            sum_1=> salida,
            sum_2 => mult1,                    
            suma=>suma);            
G3: registroUnoBig port map(
                           
            D=>suma,
            clk => clk,
            reset=>reset,   
            Q=> salida );             
end Behavioral;
