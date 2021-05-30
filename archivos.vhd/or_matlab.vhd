----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.04.2021 18:26:03
-- Design Name: 
-- Module Name: or_matlab - Behavioral
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

entity or_matlab is
    Port ( a : in SIGNED (7 downto 0);
           b : in SIGNED (7 downto 0);
           c : out SIGNED (7 downto 0);
           clk : in std_logic_vector
           );
end or_matlab;

architecture Behavioral of or_matlab is

begin


    c <=a OR b;
       

end Behavioral;
