----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2021 18:18:48
-- Design Name: 
-- Module Name: MAC_Area_tb - Behavioral
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

entity MAC_Area_tb is
--  Port ( );
end MAC_Area_tb;

architecture Behavioral of MAC_Area_tb is
component MAC_Area 
    Port ( dato1 : in SIGNED (7 downto 0);
           dato2 : in SIGNED (7 downto 0);
           rst : in STD_LOGIC;
           clock : in STD_LOGIC;
           disruptor1 : in SIGNED (15 downto 0);
           disruptor2 : in SIGNED (15 downto 0);
           disruptor3 : in SIGNED (15 downto 0);
           output : inout SIGNED (15 downto 0));
end component;
signal dato1, dato2 : SIGNED (7 downto 0);
signal clock, rst, error : STD_LOGIC;
signal output, disruptor1, disruptor2, disruptor3 : SIGNED(15 downto 0);
constant DELTA : time := 10 ns;
constant clk_period : time := 10 ns;
begin
DUT1 : MAC_Area
        port map(
            dato1 => dato1,
            dato2 => dato2,
            rst=>rst,
            clock => clock,
            disruptor1=>disruptor1,
            disruptor2=>disruptor2,
            disruptor3=>disruptor3,
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
                             disruptor1 <="0000000000000000";
                             disruptor2 <="0000000000000000";
                             disruptor3 <="0000000000000000";
                             dato1 <= "10000010";--0
                             dato2 <= "10000011";--0
                             rst<='1';
                             wait for DELTA; 
                               
                             disruptor1 <="0000000010000000";
                             disruptor2 <="0000100000000000";
                             disruptor3 <="0000000000000010";
                             dato1 <= "00000010";--0
                             dato2 <= "00000011";--0
                             rst<='0';
                             wait for DELTA;
                             
                           --  disruptor1 <="0000000010000000";
                           --  disruptor2 <="0000100000000000";
                           --  disruptor3 <="0000000000000010";
                             dato1 <= "00000001";--0
                             dato2 <= "00000001";--0
                             rst<='0';
                             wait for DELTA;
                             
                           --  disruptor1 <="0000000010000000";
                          --   disruptor2 <="0000100000000000";
                          --   disruptor3 <="0000000000000010";
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