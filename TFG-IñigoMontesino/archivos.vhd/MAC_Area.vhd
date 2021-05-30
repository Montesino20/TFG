----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2021 18:16:33
-- Design Name: 
-- Module Name: MAC_Area - Behavioral
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

entity MAC_Area is
    Port ( dato1 : in SIGNED (7 downto 0);
           dato2 : in SIGNED (7 downto 0);
           rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           disruptor : in STD_LOGIC_VECTOR (47 downto 0);
           salida : inout SIGNED  (15 downto 0));
end MAC_Area;

architecture Behavioral of MAC_Area is

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
component registroUnoBig 
    Port ( D : in SIGNED (15 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           Q : out SIGNED (15 downto 0));
end component;
component dis
    Port ( disruptor : in STD_LOGIC_VECTOR (15 downto 0);
           sig : in SIGNED (15 downto 0);
           salida : out SIGNED (15 downto 0));
end component;
signal mult1, mult2, mult3 : SIGNED (15 downto 0);
signal sum1, sum2, sum3, r1, r2, r3, dr1, dr2, dr3 : SIGNED (15 downto 0);
--signal voterOut : SIGNED (15 downto 0);
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
             sum_1=>salida ,
             sum_2 => mult1,
             suma=>sum1);  
             
                          
H5: sumador port map(
             sum_1=>salida,
             sum_2 => mult2,
             suma=>sum2);                                   
                                                                         
H6: sumador port map(
             sum_1=>salida,
             sum_2 => mult3,  
             suma=>sum3);

Reg1: registroUnoBig port map(
             D=>sum1,
             clk => clk,
             reset=>rst,   
             Q=> r1 );
D1: dis port map(
             disruptor=>disruptor(47 downto 32),
             sig =>r1,
             salida =>dr1);            
Reg2: registroUnoBig port map(
             D=>sum2,
             clk => clk,
             reset=>rst,   
             Q=> r2 );
D2: dis port map(
             disruptor=>disruptor(31 downto 16),
             sig =>r2,
             salida =>dr2);             
Reg3: registroUnoBig port map(
              D=>sum3,
              clk => clk,
              reset=>rst,   
              Q=> r3 ); 
D3: dis port map(
              disruptor=>disruptor(15 downto 0),
              sig =>r3,
              salida =>dr3);                 
H7: voter port map(
              v1=>dr1,
              v2=>dr2,
              v3=>dr3,
              decision => salida);                                                               
end Behavioral;
