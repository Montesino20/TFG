----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.03.2021 16:35:29
-- Design Name: 
-- Module Name: control2_tb - Behavioral
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

entity control2_tb is
--  Port ( );
end control2_tb;

architecture Behavioral of control2_tb is
component control2 
    Port ( dato1 : in SIGNED (7 downto 0);
           dato2 : in SIGNED (7 downto 0);
           rst : in STD_LOGIC;
           clock : in STD_LOGIC;
         --  error : out STD_LOGIC;
           output : inout SIGNED (15 downto 0));
end component;
signal dato1, dato2 : SIGNED (7 downto 0);
signal clock, rst, error : STD_LOGIC;
--signal o1, o2, o3 : SIGNED(15 downto 0);
signal output : SIGNED(15 downto 0);
constant DELTA : time := 10 ns;
constant clk_period : time := 10 ns;
begin
DUT1 : control2
        port map(
            dato1 => dato1,
            dato2 => dato2,
            rst=>rst,
            clock => clock,
           -- error => error,
            output=> output);
            
clk_process1 :process
                    begin
                        clock <= '0';
                        wait for clk_period/2;
                        clock <= '1';
                        wait for clk_period/2;
             end process;  

process
                     begin
                             
                             dato1 <= "10000010";--0
                             dato2 <= "10000011";--0
                             rst<='1';
                             wait for DELTA;   
                             
                             dato1 <= "00000010";--0
                             dato2 <= "00000011";--0
                             rst<='0';
                             wait for DELTA;
                             
                             dato1 <= "00000001";--0
                             dato2 <= "00000001";--0
                             rst<='0';
                             wait for DELTA;
                             
                             dato1 <= "11111101";--0
                             dato2 <= "00000101";--0
                             rst<='0';
                             wait for DELTA;
 
                             dato1 <= "11111110";--0
                             dato2 <= "00000011";--0
                             rst<='0';
                             wait for DELTA;
                             
                             dato1 <= "00000001";--0
                             dato2 <= "00001000";--0
                             rst<='0';
                             wait for DELTA;
                             
                             dato1 <= "11111100";--0
                             dato2 <= "00000100";--0
                             rst<='0';
                             wait for DELTA;
 
                             dato1 <= "11111011";--0
                             dato2 <= "00000101";--0
                             rst<='0';
                             wait for DELTA; 
                             
                             dato1 <= "00000001";--0
                             dato2 <= "00001000";--0
                             rst<='0';
                             wait for DELTA;
                                                         
                             dato1 <= "11111100";--0
                             dato2 <= "00000110";--0
                             rst<='1';
                             wait for DELTA;
                              
                             dato1 <= "11111011";--0
                             dato2 <= "00000100";--0
                             rst<='0';
                             wait for DELTA;                            
                             
                             dato1 <= "11111001";--0
                             dato2 <= "00000000";--0
                             rst<='0';
                             wait for DELTA; 
                                                          
                             dato1 <= "00000001";--0
                             dato2 <= "00001000";--0
                             rst<='0';
                             wait for DELTA;
                                                                                      
                             dato1 <= "11111111";--0
                             dato2 <= "00000010";--0
                             rst<='0';
                             wait for DELTA;
                                                           
                              dato1 <= "11111011";--0
                              dato2 <= "00000100";--0
                              rst<='0';
                              wait for DELTA;                            
                                 
                             
                     wait;
                     end process;

end Behavioral;
