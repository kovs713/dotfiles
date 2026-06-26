for _, module in ipairs({
	"envs",
	"monitors",
	"input",
	"looknfeel",
	"windows",
	"autostart",
	"bindings",
}) do
	package.loaded[module] = nil
	require(module)
end
