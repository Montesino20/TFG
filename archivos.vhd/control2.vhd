----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.03.2021 16:11:17
-- Design Name: 
-- Module Name: control2 - Behavioral
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

entity control2 is
    Port ( dato1 : in SIGNED (7 downto 0);
           dato2 : in SIGNED (7 downto 0);
           rst : in STD_LOGIC;
           clock : in STD_LOGIC;
           output : inout SIGNED (15 downto 0));
end control2;

architecture Behavioral of control2 is

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
component voter 
 Generic ( vector_width: integer:=16);
    Port ( v1 : in SIGNED (15 downto 0);
           v2 : in SIGNED (15 downto 0);
           v3 : in SIGNED (15 downto 0);
           decision : out SIGNED (15 downto 0));
end component;
component registroSalida 
    Port ( D : in SIGNED (15 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           Q : out SIGNED (15 downto 0));
end component;
signal mult1, mult2, mult3 : SIGNED (15 downto 0);
signal sum1, sum2, sum3 : SIGNED (15 downto 0);
signal voterOut : SIGNED (15 downto 0);
begin

H1: multiplicador port map(
            mult_x=>dato1,
            mult_y => dato2,
            producto=>mult1);
           
            
H2: multiplicador port map(
            mult_x=>dato1,
            mult_y => dato2,
            producto=>mult2);
            
H3: multiplicador port map(
             mult_x=>dato1,
             mult_y => dato2,
             producto=>mult3); 
             
H4: sumador port map(
             sum_1=>output ,
             sum_2 => mult1,
             suma=>sum1);  
             
                          
H5: sumador port map(
             sum_1=>output,
             sum_2 => mult2,
             suma=>sum2);                                   
                                                                         
H6: sumador port map(
             sum_1=>output,
             sum_2 => mult3,  
             suma=>sum3);
H7: voter port map(
             v1=>sum1,
             v2=>sum2,
             v3=>sum3,
             decision => voterOut); 
H8: registroSalida port map(
             D=>voterOut,
             clk => clock,
             reset=>rst,   
             Q=> output );               
end Behavioral;
