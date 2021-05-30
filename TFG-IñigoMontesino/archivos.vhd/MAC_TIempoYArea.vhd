----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.05.2021 10:36:35
-- Design Name: 
-- Module Name: MAC_TIempoYArea - Behavioral
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

entity MAC_TIempoYArea is
Port (     dato1 : in SIGNED (7 downto 0);
           dato2 : in SIGNED (7 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           disruptor : in STD_LOGIC_VECTOR (287 downto 0);
           salida : inout SIGNED (15 downto 0);
           error : inout SIGNED (10 downto 0));
end MAC_TIempoYArea;

architecture Behavioral of MAC_TIempoYArea is
component MAC_Tiempo2 
    Port ( dato1 : in SIGNED (7 downto 0);
           dato2 : in SIGNED (7 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           disruptor : in STD_LOGIC_VECTOR (95 downto 0);
           realimentacion: in SIGNED (15 downto 0);
           salida : inout SIGNED (15 downto 0);
           error : inout SIGNED (10 downto 0));
end component;
component voter 
 Generic ( vector_width: integer:=16);
    Port ( v1 : in SIGNED (15 downto 0);
           v2 : in SIGNED (15 downto 0);
           v3 : in SIGNED (15 downto 0);
           decision : out SIGNED (15 downto 0));
end component;
signal voter1, voter2, voter3 : SIGNED (15 downto 0);
begin
T1: MAC_Tiempo2 port map(
        dato1=>dato1,
        dato2=>dato2,
        clk=>clk,
        reset=>reset,
        disruptor=>disruptor(287 downto 192),
        realimentacion=>salida,
        salida=>voter1,
        error=>error);
T2: MAC_Tiempo2 port map(
                dato1=>dato1,
                dato2=>dato2,
                clk=>clk,
                reset=>reset,
                disruptor=>disruptor(191 downto 96),
                realimentacion=>salida,
                salida=>voter2,
                error=>error);  
T3: MAC_Tiempo2 port map(
           dato1=>dato1,
           dato2=>dato2,
            clk=>clk,
            reset=>reset,
            disruptor=>disruptor(95 downto 0),
            realimentacion=>salida,
            salida=>voter3,
              error=>error); 
V:  voter generic map( 
          vector_width => 16)
              port map(
                v1=>voter1,
                v2=>voter2,
                v3=>voter3,
                decision => salida);                                   
end Behavioral;
