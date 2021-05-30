----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.03.2021 23:27:47
-- Design Name: 
-- Module Name: voter - Behavioral
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

entity voter is
    Generic ( vector_width: integer:=16);
    Port ( v1 : in SIGNED (vector_width-1 downto 0);
           v2 : in SIGNED (vector_width-1 downto 0);
           v3 : in SIGNED (vector_width-1 downto 0);
           decision : out SIGNED (vector_width-1 downto 0));
end voter;

architecture Behavioral of voter is

signal i : integer;
--signal aux : SIGNED (15 downto 0);
component voter_bit is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           y : out STD_LOGIC);
end component;

begin


gen_voterx: for I in 0 to vector_width-1 generate

  voterx: voter_bit port map(v1(i), v2(i), v3(i), decision(i));
  
end generate gen_voterx;

end Behavioral;