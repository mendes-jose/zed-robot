/*
** Copyright (C) 2025 Sylvain Fargier
**
** This software is provided 'as-is', without any express or implied
** warranty.  In no event will the authors be held liable for any damages
** arising from the use of this software.
**
** Permission is granted to anyone to use this software for any purpose,
** including commercial applications, and to alter it and redistribute it
** freely, subject to the following restrictions:
**
** 1. The origin of this software must not be misrepresented; you must not
**    claim that you wrote the original software. If you use this software
**    in a product, an acknowledgment in the product documentation would be
**    appreciated but is not required.
** 2. Altered source versions must be plainly marked as such, and must not be
**    misrepresented as being the original software.
** 3. This notice may not be removed or altered from any source distribution.
**
** Author: Sylvain Fargier <fargier.sylvain@gmail.com>
*/

use zed_extension_api::{
    self as zed, LanguageServerId, Result,
    process::Command,
    settings::{CommandSettings, LspSettings},
};

struct RobotFrameworkExtension {}

impl zed::Extension for RobotFrameworkExtension {
    fn new() -> Self {
        Self {}
    }

    fn language_server_command(
        &mut self,
        server_id: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<Command> {
        let mut cmd = LspSettings::for_worktree(server_id.as_ref(), worktree)
            .ok()
            .and_then(|settings| settings.binary)
            .unwrap_or_else(|| CommandSettings {
                path: None,
                arguments: None,
                env: None,
            });
        // path may not be set in settings
        if cmd.path.is_none() {
            cmd.path = worktree.which("robotframework_ls");
        }

        match cmd.path {
            Some(path) => Ok(Command {
                command: path,
                args: cmd.arguments.unwrap_or_else(|| vec!["-v".into()]),
                env: cmd
                    .env
                    .unwrap_or_default()
                    .into_iter()
                    .map(|(k, v)| (k, v))
                    .collect(),
            }),
            None => Err("Unable to find robotframework_ls from worktree".into()),
        }
    }

    fn language_server_initialization_options(
        &mut self,
        server_id: &LanguageServerId,
        worktree: &zed_extension_api::Worktree,
    ) -> Result<Option<zed_extension_api::serde_json::Value>> {
        let settings = LspSettings::for_worktree(server_id.as_ref(), worktree)
            .ok()
            .and_then(|lsp_settings| lsp_settings.initialization_options.clone())
            .unwrap_or_default();
        Ok(Some(settings))
    }

    fn language_server_workspace_configuration(
        &mut self,
        server_id: &LanguageServerId,
        worktree: &zed_extension_api::Worktree,
    ) -> Result<Option<zed_extension_api::serde_json::Value>> {
        let settings = LspSettings::for_worktree(server_id.as_ref(), worktree)
            .ok()
            .and_then(|lsp_settings| lsp_settings.settings.clone())
            .unwrap_or_default();

        Ok(Some(settings))
    }
}

zed::register_extension!(RobotFrameworkExtension);
