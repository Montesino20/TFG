----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.03.2021 18:55:59
-- Design Name: 
-- Module Name: MAC_Tiempo - Behavioral
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

entity MAC_Tiempo is
    Port ( dato1 : in SIGNED (7 downto 0);
           dato2 : in SIGNED (7 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           disruptor : in STD_LOGIC_VECTOR (95 downto 0);
           salida : inout SIGNED (15 downto 0);
           error : inout SIGNED (10 downto 0));
end MAC_Tiempo;

architecture Behavioral of MAC_Tiempo is
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
component registroT0 
    Port ( D : in SIGNED (15 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           cont : in SIGNED (1 downto 0);
           Q : out SIGNED (15 downto 0));
end component;
component registroT1 
    Port ( D : in SIGNED (15 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           cont : in SIGNED (1 downto 0);
           Q : out SIGNED (15 downto 0));
end component;
component registroT2 
    Port ( D : in SIGNED (15 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           cont : in SIGNED (1 downto 0);
           Q : out SIGNED (15 downto 0));
end component;
component contador 
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           output : inout SIGNED (1 downto 0));
end component;
component comparador 
    Port ( a : in SIGNED (15 downto 0);
           b : in SIGNED (15 downto 0);
           cont : in SIGNED (1 downto 0);
           error : inout SIGNED (10 DOWNTO 0));
end component;
signal mult1, suma, R1, R2, R3, R4, R5, R6  : SIGNED (15 downto 0);
signal dR1, dR2, dR3, dR4, dR5, dR6, vout, comp1, comp2, comp3  : SIGNED (15 downto 0);
signal cuenta : SIGNED (1 downto 0);
signal err : SIGNED(10 downto 0);
begin

G1: multiplicador port map(
            mult_x=>dato1,
            mult_y => dato2,
            producto=>mult1);
            
G2: sumador port map(
            sum_1=> salida,
            sum_2 => mult1,                    
            suma=>suma);
G3: contador port map (
            clk =>clk,
            reset=>reset,
            output=>cuenta);           
A1: registroT0 port map(
                                       
            D=>suma,
            clk => clk,
            reset=>reset,
            cont=>cuenta,   
            Q=> R1 ); 
            
DA1: dis port map(
            disruptor=>disruptor(95 downto 80),
            sig =>R1,
            salida =>dR1);            

A2: registroUnoBig port map(
                                       
            D=>dR1,
            clk => clk,
            reset=>reset,   
            Q=> R2 );
DA2: dis port map(
            disruptor=>disruptor(79 downto 64),
            sig =>R2,
            salida =>dR2);            
A3: registroUnoBig port map(
                                                   
            D=>dR2,
            clk => clk,
            reset=>reset,   
            Q=> dR3 );
DA3: dis port map(
            disruptor=>disruptor(63 downto 48),
            sig =>dR3,
            salida =>R3);                                                           
B1: registroT1 port map(
                                                   
            D=>suma,
            clk => clk,
            reset=>reset,
            cont=>cuenta,   
            Q=> R4 ); 
DB1: dis port map(
            disruptor=>disruptor(47 downto 32),
            sig =>R4,
            salida =>dR4);             
B2: registroUnoBig port map(
                                                   
            D=>dR4,
            clk => clk,
            reset=>reset,   
            Q=> dR5 );
DB2: dis port map(
            disruptor=>disruptor(31 downto 16),
            sig =>dR5,
            salida =>R5);  
C1: registroT2 port map(
                                                               
             D=>suma,
             clk => clk,
             reset=>reset,
             cont => cuenta,   
             Q=> dR6 );
DC1: dis port map(
             disruptor=>disruptor(15 downto 0),
             sig =>dR6,
             salida =>R6);             
V:  voter generic map( 
             vector_width => 16)
              port map(
              v1=>R3,
              v2=>R5,
              v3=>R6,
              decision => salida);
 comReg1: registroUnoBig port map(
                                                     
                          D=>suma,
                          clk => clk,
                          reset=>reset,   
                          Q=> comp1 );
comReg2: registroUnoBig port map(
                                                                 
                          D=>comp1,
                          clk => clk,
                          reset=>reset,   
                          Q=> comp2 );
comReg3: registroUnoBig port map(
                                                                             
                            D=>comp2,
                            clk => clk,
                            reset=>reset,   
                           Q=> comp3 );            
comp: comparador port map(
              a=>salida,
              b=>comp3,
              cont=>cuenta,
              error=>error);                           
end Behavioral;
