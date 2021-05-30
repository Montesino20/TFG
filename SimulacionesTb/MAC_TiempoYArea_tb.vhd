----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.05.2021 10:55:21
-- Design Name: 
-- Module Name: MAC_TiempoYArea_tb - Behavioral
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

entity MAC_TiempoYArea_tb is
--  Port ( );
end MAC_TiempoYArea_tb;
architecture Behavioral of MAC_TiempoYArea_tb is
component MAC_TiempoYArea 
   Port (     dato1 : in SIGNED (7 downto 0);
           dato2 : in SIGNED (7 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           disruptor : in STD_LOGIC_VECTOR (287 downto 0);
           salida : inout SIGNED (15 downto 0);
           error : inout SIGNED (10 downto 0));
end component;

signal dato1, dato2 : SIGNED (7 downto 0);
signal clk, reset : STD_LOGIC;
signal error : SIGNED(10 downto 0);
signal salida : SIGNED(15 downto 0);
signal disruptor : STD_LOGIC_VECTOR(287 downto 0):=(others =>'0') ;
constant DELTA : time := 75 ns;
constant clk_period : time := 25 ns;
begin
DUT : MAC_TiempoYArea
        port map(
            dato1 => dato1,
            dato2 => dato2,
            clk => clk,
            reset=>reset,
            disruptor => disruptor,
            salida=> salida,
            error=>error);
            
clk_process :process
                    begin
                        clk <= '0';
                        wait for clk_period/2;
                        clk <= '1';
                        wait for clk_period/2;
             end process;
        
                                                            
process
 begin
                            reset<='1';
                            dato1 <= "10000010";--0
                            dato2 <= "10000011";--0
                            wait for DELTA;   
                            
                            dato1 <= "00000010";--0
                            dato2 <= "00000011";--0
                            
                            reset<='0';
                            wait for DELTA;
                            
                            dato1 <= "00000001";--0
                            dato2 <= "00000001";--0
                            reset<='0';
                            wait for DELTA;
                            
                            dato1 <= "11111101";--0
                            dato2 <= "00000101";--0
                            reset<='0';
                            wait for DELTA;
                            
                            
                            dato1 <= "11111110";--0
                            dato2 <= "00000011";--0
                            reset<='0';
                            wait for DELTA;
                            
                            
                            dato1 <= "00000001";--0
                            dato2 <= "00001000";--0
                            reset<='0';
                            wait for DELTA;
                            
                            dato1 <= "11111100";--0
                            dato2 <= "00000100";--0
                            reset<='0';
                            wait for DELTA;

                            dato1 <= "11111011";--0
                            dato2 <= "00000101";--0
                            reset<='0';
                            wait for DELTA; 
                            
                            dato1 <= "00000001";--0
                            dato2 <= "00001000";--0
                            reset<='0';
                            wait for DELTA;
                                                        
                            dato1 <= "11111100";--0
                            dato2 <= "00000110";--0
                           -- reset<='1';
                            reset<='0';
                            wait for DELTA;
                             
                            dato1 <= "11111011";--0
                            dato2 <= "00000100";--0
                            reset<='0';
                            wait for DELTA;                            
                            
                            dato1 <= "11111001";--0
                            dato2 <= "00000001";--0
                            reset<='0';
                            wait for DELTA; 
                                                         
                            dato1 <= "00000001";--0
                            dato2 <= "00001000";--0
                            reset<='0';
                            wait for DELTA;
                                                                                     
                            dato1 <= "11111111";--0
                            dato2 <= "00000010";--0
                            reset<='0';
                            wait for DELTA;
                                                          
                             dato1 <= "11111011";--0
                             dato2 <= "00000100";--0
                             reset<='0';
                             wait for DELTA;                            
                                
                            
                    wait;
                    end process;

end Behavioral;