----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.03.2021 23:28:50
-- Design Name: 
-- Module Name: voter_tb - Behavioral
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

entity voter_tb is
end voter_tb;

architecture Behavioral of voter_tb is

component voter is
    Port ( v1 : in SIGNED (15 downto 0);
           v2 : in SIGNED (15 downto 0);
           v3 : in SIGNED (15 downto 0);
          -- reset: in STD_LOGIC;
           error : out STD_LOGIC;
           decision : out SIGNED (15 downto 0));
end component;

signal v1, v2, v3, decision : SIGNED (15 downto 0);
signal error :  STD_LOGIC ;
constant DELTA : time := 100 ns;
begin

DUT : voter
        port map(
            v1 => v1,
            v2 => v2,
            v3 => v3,
          --  reset => reset,
            error => error,
            decision => decision);
process
    begin
                     wait for DELTA;
                      wait for DELTA;
                       wait for DELTA;
                    v1 <= "0100010001000100";
                    v2 <= "0100010001000100";
                    v3 <= "0101010001000100";
            
                    wait for DELTA;
                    
                    v1 <= "0001000100010001";
                    v2 <= "0010001000100010";
                    v3 <= "0010001000100010";
                 --   reset <= '1';
                    
                     wait for DELTA;
                     
                     v1 <= "0001000100010001";
                     v2 <= "0010001000100010";
                     v3 <= "0001000100010001";
                   --  reset <= '0';
                     wait for DELTA;
                     
                             v1 <= "0000000000000000"; -- 3
                             v2 <= "0000000000000000";
                             v3 <= "0000001000100011";
                             
                             wait for DELTA;
                     
                             v1 <= "0000000000000000"; -- 3
                             v2 <= "0000010001000101";
                             v3 <= "0000000000000000";
                             
                             wait for DELTA;        
                             v1 <= "0000000000000000"; -- 3
                             v2 <= "0001000100010001";
                             v3 <= "0001000100010001";
                             
                             wait for DELTA;
                             v1 <= "0001000100010001"; -- 3
                             v2 <= "0000000000000000";
                             v3 <= "1000100010001000";
                             
                             wait for DELTA;
                             v1 <= "0011001100110011"; -- 3
                             v2 <= "0000000000000000";
                             v3 <= "1001001100110011";
                             
                             wait for DELTA;
                             v1 <= "0001000100010001"; -- 3
                             v2 <= "0001000100010001";
                             v3 <= "0000000000000000";
                             
                             wait for DELTA;
                             v1 <= "0001000100010001"; -- 3
                             v2 <= "0001000100010001";
                             v3 <= "0001000100010001";
                             
                             wait for DELTA;                                        
                             
wait;
end process;
end Behavioral;