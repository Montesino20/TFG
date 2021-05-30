----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.03.2021 20:53:09
-- Design Name: 
-- Module Name: registroUnoBig_tb - Behavioral
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

entity registroUnoBig_tb is
--  Port ( );
end registroUnoBig_tb;


architecture Behavioral of registroUnoBig_tb is
component registroUnoBig is
    Port ( D : in SIGNED (15 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           Q : out SIGNED (15 downto 0));
end component;


signal D : SIGNED(15 downto 0);
signal clk, reset: STD_LOGIC;
--output signals declaration
signal Q: SIGNED(15 downto 0);


constant DELTA : time := 150 ns;
constant clk_period : time := 50 ns;
begin

DUT : RegistroUnoBig
        port map(
            D => D,
            clk => clk,
            reset=> reset,
            Q => Q);

clk_process :process
        begin
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end process;

process
                begin
                        D <= "1001011110001001";--0

                        wait for DELTA;
                        
                        reset <='1';
                        D <= "1111011110001001";--0
                        wait for DELTA;
                        
                        D <= "1011110001010011";--0
                        wait for DELTA; 
                        reset <='0';
                        D <= "1001111110001001";--0
                        wait for DELTA;
                        
                        D <= "1001011110001001";--0
                        wait for DELTA;
                        
                        D <= "0001111100010100";--0
                        wait for DELTA;                
                                       
                        
                        
                        
                wait;
                end process;       
        end Behavioral;


