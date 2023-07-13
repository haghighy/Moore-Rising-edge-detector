library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity edgedetector_tb is
end edgedetector_tb;

architecture TB_ARCHITECTURE of edgedetector_tb is
	-- Component declaration of the tested unit
	component edgedetector
	port(
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		level : in STD_LOGIC;
		Moore_tick : out STD_LOGIC );
	end component;

    -- Stimulus signals
    signal clk : std_logic := '0';
    signal reset : std_logic := '1';
    signal level : std_logic := '0';
    -- Observed signals
    signal Moore_tick : std_logic;

	-- Add your code here ...
begin		   
    -- Clock process
    process
    begin
        while now < 1000 ns loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
        wait;
    end process;

	-- Unit Under Test port map
	UUT : edgedetector
		port map (
			clk => clk,
			reset => reset,
			level => level,
			Moore_tick => Moore_tick
		);

	-- Add your stimulus here ...
    process
    begin
        -- Initialize reset and level
        reset <= '1';
        level <= '0';

        wait for 10 ns;

        reset <= '0';

        -- Test case 1: No edge detected
        level <= '0';
        wait for 10 ns;
        assert Moore_tick = '0' report "Test case 1 failed" severity error;

        -- Test case 2: Rising edge detected
        level <= '1';
        wait for 10 ns;
        assert Moore_tick = '1' report "Test case 2 failed" severity error;

        level <= '0';
        wait for 10 ns;
        assert Moore_tick = '0' report "Test case 2 failed" severity error;

        -- Test case 3: Falling edge detected
        level <= '1';
        wait for 10 ns;
        assert Moore_tick = '0' report "Test case 3 failed" severity error;

        level <= '0';
        wait for 10 ns;
        assert Moore_tick = '0' report "Test case 3 failed" severity error;

        -- Test case 4: No edge detected
        level <= '1';
        wait for 10 ns;
        assert Moore_tick = '0' report "Test case 4 failed" severity error;

        level <= '1';
        wait for 10 ns;
        assert Moore_tick = '0' report "Test case 4 failed" severity error;

        -- Test case 5: Rising edge detected
        level <= '0';
        wait for 10 ns;
        assert Moore_tick = '0' report "Test case 5 failed" severity error;

        level <= '1';
        wait for 10 ns;
        assert Moore_tick = '0' report "Test case 5 failed" severity error;

        wait;

    end process;
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_edgedetector of edgedetector_tb is
	for TB_ARCHITECTURE
		for UUT : edgedetector
			use entity work.edgedetector(arch);
		end for;
	end for;
end TESTBENCH_FOR_edgedetector;

