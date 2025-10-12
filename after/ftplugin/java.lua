local jdtls = require("jdtls")
-- local jdtls_dap = require("jdtls.dap")
local jdtls_setup = require("jdtls.setup")
local home = os.getenv("HOME")

local root_markers = {
    "gradlew",
    "build.gradle",
    "pom.xml",
    ".git",
    "mvnw",
}

local root_dir = jdtls_setup.find_root(root_markers)

local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = home .. "/.cache/jdtls/workspace" .. project_name

-- 💀
local path_to_mason_packages = home .. "/.local/share/nvim/mason/packages"
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^

local path_to_jdtls = path_to_mason_packages .. "/jdtls"
-- local path_to_jdebug = path_to_mason_packages .. "/java-debug-adapter"
-- local path_to_jtest = path_to_mason_packages .. "/java-test"

local path_to_config = path_to_jdtls .. "/config_linux"
local lombok_path = path_to_jdtls .. "/lombok.jar"

local pattern = path_to_jdtls .. "/plugins/org.eclipse.equinox.launcher_*.jar"
local valid_paths = vim.fn.glob(pattern, true, true)

local path_to_jar
for _, file in ipairs(valid_paths) do
    path_to_jar = file
end
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^

local bundles = {
    -- vim.fn.glob(path_to_jdebug .. "/extension/server/com.microsoft.java.debug.plugin-*.jar", true),
}

-- vim.list_extend(bundles, vim.split(vim.fn.glob(path_to_jtest .. "/extension/server/*.jar", true), "\n"))

-- LSP settings for Java.
local on_attach = function(_, bufnr)
    -- jdtls.setup_dap({ hotcodereplace = "auto" })
    -- jdtls_dap.setup_dap_main_class_configs()
    jdtls_setup.add_commands()

    -- require("lsp_signature").on_attach({
    --     bind = true,
    --     padding = "",
    --     handler_opts = {
    --         border = "rounded",
    --     },
    --     hint_prefix = "󱄑 ",
    -- }, bufnr)

    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.definition, opts) -- fd -> function definition
    vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<leader>gh", vim.lsp.buf.signature_help, opts)

    vim.keymap.set("n", "<leader>v", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>i", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)      -- r -> rename
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts) -- a -> action
    vim.keymap.set("n", "<leader>u", vim.lsp.buf.references, opts)  -- u -> usages
    vim.keymap.set("n", "<leader>h", function()
        vim.diagnostic.open_float()
    end)

    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)

    vim.keymap.set("n", "<leader>f", function()
        require("jdtls").organize_imports()
        vim.lsp.buf.format { async = true }
    end, opts)
    vim.keymap.set("n", "<leader>jrv", function()
        require("jdtls").extract_variable()
    end, opts)
    vim.keymap.set("n", "<leader>jrc", function()
        require("jdtls").extract_constant()
    end, opts)

    -- would be nice to know how to refactor this into a similar form to the previous keybinds...
    vim.keymap.set("x", "<leader>jrv", "<esc><cmd>lua require('jdtls').extract_variable(true)<cr>", opts)
    vim.keymap.set("x", "<leader>jrc", "<esc><cmd>lua require('jdtls').extract_constant(true)<cr>", opts)
    vim.keymap.set("x", "<leader>jrm", "<esc><Cmd>lua require('jdtls').extract_method(true)<cr>", opts)
end

local capabilities = {
    workspace = {
        configuration = true
    },
    textDocument = {
        completion = {
            completionItem = {
                snippetSupport = true
            }
        }
    }
}

local config = {
    flags = {
        allow_incremental_sync = true,
    }
}

config.cmd = {
    --
    -- 				-- 💀
    "/usr/lib/jvm/java-21-openjdk/bin/java", -- or '/path/to/java17_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "-javaagent:" .. lombok_path,
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    -- 💀
    "-jar",
    path_to_jar,
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
    -- Must point to the                                                     Change this to
    -- eclipse.jdt.ls installation                                           the actual version

    -- 💀
    "-configuration",
    path_to_config,
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
    -- Must point to the                      Change to one of `linux`, `win` or `mac`
    -- eclipse.jdt.ls installation            Depending on your system.

    -- 💀
    -- See `data directory configuration` section in the README
    "-data",
    workspace_dir,
}

config.settings = {
    java = {
        references = {
            includeDecompiledSources = true,
        },
        format = {
            enabled = true,
        },
        eclipse = {
            downloadSources = true,
        },
        maven = {
            downloadSources = true,
        },
        signatureHelp = { enabled = true },
        contentProvider = { preferred = "fernflower" },
        completion = {
            filteredTypes = {
                "com.sun.*",
                "io.micrometer.shaded.*",
                "java.awt.*",
                "jdk.*",
                "sun.*",
            },
            importOrder = {
                "java",
                "javax",
                "com",
                "org",
            },
        },
        sources = {
            organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999,
            },
        },
    },
}

config.on_attach = on_attach
config.capabilities = capabilities
config.on_init = function(client, _)
    client.notify('workspace/didChangeConfiguration', { settings = config.settings })
end

local extendedClientCapabilities = require 'jdtls'.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

config.init_options = {
    bundles = bundles,
    extendedClientCapabilities = extendedClientCapabilities,
}

-- Start Server
require('jdtls').start_or_attach(config)
