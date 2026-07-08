Git Fork Prep

This folder contains a clean handoff for preparing a GitHub fork.

Files in this folder
- clean-fork.diff
- 0002-add-version-file.diff
- COMMIT_FILES.txt
- DO_NOT_COMMIT.txt
- .gitignore.release
- cleanup-binary-artifacts.ps1

Notes
- `clean-fork.diff` is the main source/package diff against the upstream 4.5.0 tag.
- `VERSION` is ignored by the repo's current `.gitignore`, so it is provided separately in `0002-add-version-file.diff` and must be force-added if you commit manually.
- The built `.deb`, `.ddeb`, `.buildinfo`, `.changes`, and temporary packaging directories should not be committed to the fork.
- `bundle-rootfs/` is not included in the clean diff. If you keep the fork clean, publish the final `.deb` as a GitHub Release asset rather than trying to rebuild from the fork alone.

Suggested flow
1. Apply or reproduce `clean-fork.diff`.
2. Add `VERSION` from `0002-add-version-file.diff`.
3. Use `.gitignore.release` in the repo root.
4. Run `cleanup-binary-artifacts.ps1` before checking `git status`.
5. Commit only the files listed in `COMMIT_FILES.txt`.
