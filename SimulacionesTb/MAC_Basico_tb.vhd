----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.03.2021 13:53:09
-- Design Name: 
-- Module Name: MAC_Basico_tb - Behavioral
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

entity MAC_Basico_tb is
--  Port ( );
end MAC_Basico_tb;

architecture Behavioral of MAC_Basico_tb is
component MAC_Basico 
    Port ( dato1 : in SIGNED (7 downto 0);
           dato2 : in SIGNED (7 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           salida : inout SIGNED (15 downto 0));
end component;
signal dato1, dato2 : SIGNED (7 downto 0);
signal clk, reset : STD_LOGIC;
signal salida : SIGNED(15 downto 0);
constant DELTA : time := 100 ns;
constant clk_period : time := 100 ns;
begin
DUT : MAC_Basico
        port map(
            dato1 => dato1,
            dato2 => dato2,
            clk => clk,
            reset=>reset,
            salida=> salida);
            
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
                            reset<='1';
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
