import dracula.draw

config.load_autoconfig()

dracula.draw.blood(c, {
    "spacing" : {
        "vertical" : 1,
        "horizontal" : 2
        }
    })


c.url.searchengines = {
        'DEFAULT': 'https://google.com/search?q={}',
        "y": "https://www.youtube.com/results?search_query={}",
        "w": "https://en.wikipedia.org/wiki/{}",
        "gist": "https://gist.github.com/search?q={}"
        }


c.aliases["read"] = "spawn --userscript readability-js"
c.aliases["mpv"] = "spawn --userscript view_in_mpv"
c.aliases["aq"] = "set-cmd-text :spawn --userscript "
c.aliases["xx"] = "spawn --userscript ~/qutesc"

c.colors.webpage.darkmode.enabled = True
#c.webpage.prefers_color_scheme_dark = True
#c.content.user_stylesheets = "~/github/solarized-everything-css/css/gruvbox/gruvbox-all-sites.css"


c.content.blocking.method = 'adblock'
c.content.blocking.adblock.lists = [
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badlists.txt", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2020.txt", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2021.txt", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/resource-abuse.txt", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/thirdparties/easylist-downloads.adblockplus.org/easyprivacy.txt", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/thirdparties/pgl.yoyo.org/as/serverlist", "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts", "https://raw.githubusercontent.com/AdAway/adaway.github.io/master/hosts.txt", "https://fanboy.co.nz/fanboy-problematic-sites.txt", "https://easylist.to/easylist/easylist.txt", "https://raw.githubusercontent.com/bogachenko/fuckfuckadblock/master/fuckfuckadblock.txt"
    ]



