alias ll='ls -alF --color=auto'
alias grep='grep --color=auto'
alias .='cd ..'
alias ..='cd ../..'
alias ...='cd ../../..'
alias ....='cd ../../../..'
alias rp='realpath'
alias smem='cd /work/BPU4.0/spikehe/b40/design/vpu_usl/rtl/vpu300_usl_smem'
alias g='gvim'

export PS1="\[\e[32m\][\t]\[\e[m\] \[\e[34m\]\u@\h\[\e[m\]:\[\e[33m\]\w\[\e[m\]\$ "

cd /dir/xx
source env.sh
cd -

# 自动 cd 后 ls
cd() {
    builtin cd "$@"
    if [ $? -eq 0 ]; then
        ls -F --color=auto
    fi
}
