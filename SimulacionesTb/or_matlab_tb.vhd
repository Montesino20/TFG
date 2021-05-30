----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.04.2021 18:27:39
-- Design Name: 
-- Module Name: or_matlab_tb - Behavioral
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
--IEEE.STD_LOGIC_TEXTIO.ALL
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use std.textio.all;-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity or_matlab_tb is

end or_matlab_tb;

architecture Behavioral of or_matlab_tb is
component or_matlab 
    Port ( 
            
           a : in SIGNED (7 downto 0);
           b : in SIGNED (7 downto 0);
           clk : in STD_LOGIC;
           c : out SIGNED (7 downto 0)
           
           );
end component;

signal a: SIGNED (7 downto 0) := (others => '0');
signal c : SIGNED (7 downto 0);
signal b : SIGNED (7 downto 0)  := (others => '0');
signal clk : std_logic := '1';
constant clk_period : time := 10 ns;
BEGIN
    clk <= not clk after clk_period/2;
    
read_process : PROCESS (clk)
FILE in_file : text OPEN read_mode IS "C:\Users\Eugenia\Desktop\4to\TFG\PROYECTO\input.dat";
VARIABLE in_line : line;
VARIABLE in_int : integer;
VARIABLE in_read_ok : BOOLEAN;

begin
if (clk'event and clk = '1') then
    if NOT endfile(in_file) then
        ReadLine(in_file, in_line);
        Read(in_line, in_int, in_read_ok);
        a<=to_signed(in_int, 8);
      
        
     else 
        assert false report "Simulation Finished" severity failure;
        
     end if;
   end if;  
end process;   


DUT: or_matlab

PORT MAP(
    a=>a,
    b=>b,
    clk=>clk,
    c=> c);
    
writing_process : PROCESS (clk)
FILE out_file : text OPEN write_mode IS "C:\Users\Eugenia\Desktop\4to\TFG\PROYECTO\output.dat"; 
VARIABLE out_line : line;
VARIABLE out_int : integer;
    
    begin
  if (clk'event and clk = '1') then
    out_int := to_integer(c);
    Write (out_line, out_int, left, 16);
    WriteLine(out_file, out_line);
    end if;
end process;    
  

 process 
    begin
                  
        wait for 20 ns;
         b<="1010101010101010";
        wait for 20 ns;
         b<="1111111111111111";
   end process;   
    
end Behavioral;
