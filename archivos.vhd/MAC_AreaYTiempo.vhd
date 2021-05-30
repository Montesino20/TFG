----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2021 18:32:20
-- Design Name: 
-- Module Name: MAC_AreaYTiempo - Behavioral
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

entity MAC_AreaYTiempo is
    Port ( dato1 : in SIGNED (7 downto 0);
           dato2 : in SIGNED (7 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           disruptor : in STD_LOGIC_VECTOR (175 downto 0);
           salida : inout SIGNED (15 downto 0));
end MAC_AreaYTiempo;

architecture Behavioral of MAC_AreaYTiempo is

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


component disSmall 
    Port ( disruptor : in STD_LOGIC_VECTOR (7 downto 0);
           sig : in SIGNED (7 downto 0);
           salida : out SIGNED (7 downto 0));
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


component voter 
 Generic ( vector_width: integer:=16);
    Port ( v1 : in SIGNED (15 downto 0);
           v2 : in SIGNED (15 downto 0);
           v3 : in SIGNED (15 downto 0);
           decision : out SIGNED (15 downto 0));
end component;
signal x1, x2, y1, y2 : SIGNED (7 downto 0);
signal mult1, mult2, mult3 : SIGNED (15 downto 0);
signal t11, t12,  t21, t22,t23, t31, t32 : SIGNED (15 downto 0);
signal dR1, dR2, dR3, dR4, dR5, dR6, dR7, dR8, dR9: SIGNED (15 downto 0);
signal dR13, dR10, dR11, dR12: SIGNED (7 downto 0);
signal sum1, sum2, sum3 : SIGNED (15 downto 0);
signal o1, o2, o3 : SIGNED (15 downto 0) ;
begin

G1: multiplicador port map(
            mult_x=>dato1,
            mult_y => dato2,
            producto=>mult1);
           
            
G2: multiplicador port map(
            mult_x=>dR10,
            mult_y => dR11,
            producto=>mult2);
            
G3: multiplicador port map(
             mult_x=>dR12,
             mult_y => dR13,
             producto=>mult3); 
             
G4: sumador port map(
             sum_1=>salida ,
             sum_2 => mult1,
        
             suma=>sum1);  
             
G5: sumador port map(
             sum_1=>dR6,
             sum_2 => mult2,
           
             suma=>sum2);                                   
                                                            
G6: sumador port map(
             sum_1=>dR9,
             sum_2 => mult3,
        
             suma=>sum3);                 

G70: registroUnoBig port map(
             D=>sum1,
             clk => clk,
             reset => reset,
             Q=>t11);
  D70: dis port map(
             disruptor=>disruptor(175 downto 160),
             sig =>t11,
             salida =>dR1);           
 G71: registroUnoBig port map(
             D=>dR1,
             clk => clk,
             reset => reset,
             Q=>t12); 
    D71: dis port map(
              disruptor=>disruptor(159 downto 144),
              sig =>t12,
              salida =>dR2);                               
G72: registroUnoBig port map(
              D=>dR2,
              clk => clk,
              reset => reset,
              Q=>o1);
D72: dis port map(
              disruptor=>disruptor(143 downto 128),
              sig =>o1,
              salida =>dR3);                     
G80: registroUnoBig port map(
             D=>sum2,
             clk => clk,
             reset => reset,
             Q=>t21 );
D80: dis port map(
             disruptor=>disruptor(127 downto 112),
             sig =>t21,
             salida =>dR4); 
G81: registroUnoBig port map(
             D=>dR4,
             clk => clk,
             reset => reset,
             Q=> o2 );
D81: dis port map(
             disruptor=>disruptor(111 downto 96),
             sig =>o2,
             salida =>dR5);  
                        
G82: registroUnoBig port map(
             D=>salida,
             clk => clk,
             reset => reset,
             Q=>t22 ); 
D82: dis port map(
             disruptor=>disruptor(95 downto 80),
             sig =>t22,
             salida =>dR6);                                                          
                          
G9: registroUno port map(
             D=>dato1,
             clk => clk,
             reset =>reset,   
              Q=>x1 );   
 D9: disSmall port map(
             disruptor=>disruptor(31 downto 24),
             sig =>x1,
             salida =>dR10);             
G10: registroUno port map(
              D=>dato2,
              clk => clk,
              reset =>reset,   
              Q=>y1 );              
D10: disSmall port map(
              disruptor=>disruptor(23 downto 16),
              sig =>y1,
              salida =>dR11); 
G11: registroUno port map(
              D=>dR10,
              clk => clk,
              reset =>reset,   
              Q=>x2 );   
D11: disSmall port map(
              disruptor=>disruptor(15 downto 8),
              sig =>x2,
              salida =>dR12);                             
 G12: registroUno port map(
               D=>dR11,
               clk => clk,
               reset =>reset,   
               Q=>y2 ); 
D12: disSmall port map(
               disruptor=>disruptor(7 downto 0),
               sig =>y2,
               salida =>dR13);               
G131: registroUnoBig port map(
               D=>sum3,
               clk => clk,
               reset=>reset,   
               Q=> o3 );
D131: dis port map(
               disruptor=>disruptor(79 downto 64),
               sig =>o3,
               salida =>dR7);               
G132: registroUnoBig port map(
               D=>salida,
               clk => clk,
               reset=>reset,   
               Q=> t31 );
D132: dis port map(
               disruptor=>disruptor(63 downto 48),
               sig =>t31,
               salida =>dR8);                                       
G133: registroUnoBig port map(
               
               D=>dR8,
               clk => clk,
               reset=>reset,   
               Q=> t32 );
D133: dis port map(
               disruptor=>disruptor(47 downto 32),
               sig =>t32,
               salida =>dR9);                                               
G14: voter generic map( 
               vector_width => 16)
                port map(
                v1=>dR3,
                v2=>dR5,
                v3=>dR7,
                decision => salida); 
                
               
                                                   
end Behavioral;
