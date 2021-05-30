----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.04.2021 18:53:34
-- Design Name: 
-- Module Name: or_tb - Behavioral
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

entity or_tb is
--  Port ( );
end or_tb;

architecture Behavioral of or_tb is
component or_matlab is
    Port ( a : in SIGNED (7 downto 0);
           b : in SIGNED (7 downto 0);
           clk : in STD_LOGIC;
           c : out SIGNED (7 downto 0)
           
            );
end component;
signal a, b, c : SIGNED (7 downto 0);
signal clk : STD_LOGIC;
constant DELTA : time := 100 ns;
constant clk_period : time := 100 ns;
begin


DUT: or_matlab

        PORT MAP(
         a=>a,
         b=>b,
         clk=>clk,
         c=>c);
 clk_process :process
               begin
                         clk <= '0';
                          wait for clk_period/2;
                          clk <= '1';
                          wait for clk_period/2;
                      end process;        
         process
         begin 
                 a<="00000000";
                 b<="00001000";
                 wait for DELTA;
                 a<="00001000";
                 b<="00010000";
                 wait for DELTA;
                 a<="10000000";
                 b<="01001000";
                 wait for DELTA;
                 a<="11111111";
                 b<="00001000";
                 wait for DELTA;
end process;
end Behavioral;                 
         