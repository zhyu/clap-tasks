syntax match ClapTask        /^\s*\[\w\+\]\s\+.\{-}\s\+:\s\+.\+$/ contains=ClapTaskScope
syntax match ClapTaskScope   /^\s*\[\w\+\]\s\+/                   contained nextgroup=ClapTaskName
syntax match ClapTaskName    /.\{-}\s\+/                          contained nextgroup=ClapTaskSep
syntax match ClapTaskSep     /:/                                  contained nextgroup=ClapTaskCommand skipwhite
syntax match ClapTaskCommand /.\+$/                               contained

hi default link ClapTaskScope   Keyword
hi default link ClapTaskName    ModeMsg
hi default link ClapTaskSep     MoreMsg
hi default link ClapTaskCommand Comment
