----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.03.2021 19:26:04
-- Design Name: 
-- Module Name: control - Behavioral
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

entity control is
    Port ( dato1 : in SIGNED (7 downto 0);
           dato2 : in SIGNED (7 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           err: out STD_LOGIC;
           salida : out SIGNED (15 downto 0));
end control;

architecture Behavioral of control is

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

component RegistroUno 
    Port ( D : in SIGNED (7 downto 0);
           clk: in STD_LOGIC;
           reset : in STD_LOGIC;
           Q : out SIGNED (7 downto 0));
end component;


component registroSalida 
    Port ( D : in SIGNED (15 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           Q : out SIGNED (15 downto 0));
end component;
component registroUnoBig 
    Port ( D : in SIGNED (15 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           Q : out SIGNED (15 downto 0));
end component;




component voter 
 Generic ( vector_width: integer:=16);
    Port ( v1 : in SIGNED (15 downto 0);
           v2 : in SIGNED (15 downto 0);
           v3 : in SIGNED (15 downto 0);
         --  reset : in STD_LOGIC;
        --   error : out STD_LOGIC;
           decision : out SIGNED (15 downto 0));
end component;
signal x1, x2, y1, y2 : SIGNED (7 downto 0);
signal mult1, mult2, mult3 : SIGNED (15 downto 0);
signal t11, t12,  t21, t22,t23, t31, t32 : SIGNED (15 downto 0);
signal sum1, sum2, sum3 : SIGNED (15 downto 0);
signal voterOut : SIGNED (15 downto 0);
signal o1, o2, o3 : SIGNED (15 downto 0) ;
begin

G1: multiplicador port map(
            mult_x=>dato1,
            mult_y => dato2,
            producto=>mult1);
           
            
G2: multiplicador port map(
            mult_x=>x1,
            mult_y => y1,
            producto=>mult2);
            
G3: multiplicador port map(
             mult_x=>x2,
             mult_y => y2,
             producto=>mult3); 
             
G4: sumador port map(
             sum_1=>voterOut ,
             sum_2 => mult1,
        
             suma=>sum1);  
             
G5: sumador port map(
             sum_1=>t22,
             sum_2 => mult2,
           
             suma=>sum2);                                   
                                                            
G6: sumador port map(
             sum_1=>t32,
             sum_2 => mult3,
        
             suma=>sum3);                 

G70: registroUnoBig port map(
             D=>sum1,
             clk => clk,
             reset => reset,
             Q=>t11);
 G71: registroUnoBig port map(
                     D=>t11,
                      clk => clk,
                     reset => reset,
                     Q=>t12);            
G72: registroUnoBig port map(
                     D=>t12,
                     clk => clk,
                     reset => reset,
                     Q=>o1);
                     
G80: registroUnoBig port map(
             D=>sum2,
             clk => clk,
             reset => reset,
             Q=>t21 );

G81: registroUnoBig port map(
             D=>t21,
             clk => clk,
             reset => reset,
             Q=> o2 );
             
G82: registroUnoBig port map(
                          D=>voterOut,
                          clk => clk,
                          reset => reset,
                          Q=>t22 ); 
--G83: registroUnoBig port map(
--                          D=>t22,
--                          clk => clk,
--                          reset => reset,
--                          Q=>t23 );
                                                               
                          
G9: registroUno port map(
             D=>dato1,
             clk => clk,
             reset =>reset,   
              Q=>x1 );   
G10: registroUno port map(
              D=>dato2,
              clk => clk,
              reset =>reset,   
              Q=>y1 );              
 
G11: registroUno port map(
              D=>x1,
              clk => clk,
              reset =>reset,   
              Q=>x2 );   
                            
 G12: registroUno port map(
               D=>y1,
               clk => clk,
               reset =>reset,   
               Q=>y2 ); 
               
G131: registroUnoBig port map(
               D=>sum3,
               clk => clk,
               reset=>reset,   
               Q=> o3 );
               
G132: registroUnoBig port map(
               D=>voterOut,
               clk => clk,
               reset=>reset,   
               Q=> t31 );
                                       
G133: registroUnoBig port map(
               
               D=>t31,
               clk => clk,
               reset=>reset,   
               Q=> t32 );                               
G14: voter generic map( 
               vector_width => 16)
                port map(
                v1=>o1,
                v2=>o2,
                v3=>o3,
           --     reset=>reset,
         --       error => err,
                decision => voterOut); 
                
G15: registroSalida port map(
                               D=>voterOut,
                               clk => clk,
                               reset=>reset,   
                               Q=> salida );                
                                                   
end Behavioral;
