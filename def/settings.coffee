module.exports =

  localize: () ->
    $ = require 'jquery'
    pref = $('.settings-view')

    pref.find('a.icon.icon-settings').html('設定')
    pref.find('a.icon.icon-keyboard').html('快速鍵設定')
    pref.find('a.icon.icon-package').html('已安裝的擴充套件')
    pref.find('a.icon.icon-paintcan').html('佈景主題')
    pref.find('a.icon.icon-cloud-download').html('可用的更新')
    pref.find('a.icon.icon-plus').html('新增擴充套件')
    pref.find('button.icon.icon-link-external').html('打開設定資料夾')

    # Init
    localizeSettings()
    localizeKeybindings()
    localizePackages()
    localizeThemes()
    localizeUpdates()
    localizeInstall()
    localizeButtons()

    if pref.find('.panels').children().length < 6

      # On switch panels
      pref.find('.panels-menu li a').unbind('click').click ->
        localizeSettings() if pref.find('.panels-menu .active').attr('name') is 'Settings'
        localizeKeybindings() if pref.find('.panels-menu .active').attr('name') is 'Keybindings'
        localizePackages() if pref.find('.panels-menu .active').attr('name') is 'Packages'
        localizeThemes() if pref.find('.panels-menu .active').attr('name') is 'Themes'
        localizeUpdates() if pref.find('.panels-menu .active').attr('name') is 'Updates'
        localizeInstall() if pref.find('.panels-menu .active').attr('name') is 'Install'
        localizeButtons()
        return

      # Load all panels into DOM
      lastMenu = pref.find('.panels-menu .active a')
      pref.find('.panels-menu li a').click()
      lastMenu.click()



localizeSettings = () ->
    $ = require 'jquery'
    pref = $('.settings-view')

    # Core Settings
    pref.find('div.block.section-heading.icon.icon-gear:contains("Core Settings")').html('核心設定')
    pref.find('#core-settings-note').html('以下為文字編輯功能以外的 Atom 功能設定，個別擴充套件可能有自己的設定。若要瀏覽某個擴充套件的設定，請到「<a class="link packages-open">已安裝的擴充套件</a>」卡片清單中選擇該套件的設定。')

    pref.find('label[for="core.audioBeep"]').children('.setting-title').html('嗶嗶聲')
    pref.find('label[for="core.audioBeep"]').next('.setting-description').html('當操作無效或無結果可顯示時，以系統嗶嗶聲警告。')
    pref.find('label[for="core.destroyEmptyPanes"]').children('.setting-title').html('自動關閉空窗格')
    pref.find('label[for="core.destroyEmptyPanes"]').next('.setting-description').html('當分割窗格中的最後一個文件或項目被關閉時，也關閉該窗格。')
    pref.find('label[for="core.excludeVcsIgnoredPaths"]').children('.setting-title').html('讓擴充套件排除「版本控制系統 (VCS)」指定忽略的路徑')
    pref.find('label[for="core.excludeVcsIgnoredPaths"]').next('.setting-description').html('讓某些擴充套件排除目前專案 VCS 指定忽略的檔案和資料夾，像是模糊尋找、尋找與取代。舉例來說，使用 Git 的專案將忽略 .gitignore 中指定的路徑。另外，個別的擴充套件可能有額外關於 VCS 忽略檔案和資料夾的設定。')

    pref.find('select[id="core.fileEncoding"]').prev('label').children('.setting-title').html('檔案編碼')
    pref.find('select[id="core.fileEncoding"]').prev('label').children('.setting-description').html('指定讀寫檔案時所用的預設語系編碼。')

    pref.find('label[for="core.followSymlinks"]').children('.setting-title').html('允許使用「符號連結 (檔案替身、檔案捷徑)」')
    pref.find('label[for="core.followSymlinks"]').next('.setting-description').html('當使用模糊尋找時，允許尋找與開啟「符號連結 (檔案替身、檔案捷徑)」定義的檔案。')

    pref.find('atom-text-editor[id="core.ignoredNames"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('忽略的檔案名稱')
    pref.find('atom-text-editor[id="core.ignoredNames"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('請在此輸入字串匹配規則。符合規則的檔案和資料夾將會被某些擴充套件忽略，例如模糊尋找或者檔案清單面板。個別的擴充套件可能會有額外的忽略規則設定。')

    pref.find('label[for="core.openEmptyEditorOnStart"]').children('.setting-title').html('啟動時打開文字編輯器')
    pref.find('label[for="core.openEmptyEditorOnStart"]').next('.setting-description').html('啟動 Atom 時自動打開一個空文件。')

    pref.find('atom-text-editor[id="core.projectHome"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('預設的專案根目錄')
    pref.find('atom-text-editor[id="core.projectHome"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('所有專案都假設被放在這個資料夾下。使用主選單 > 擴充套件 > Package Generator 產生的擴充套件原始檔案也會放在這個資料夾下。')

    # Editor Settings
    pref.find('div.block.section-heading.icon.icon-gear:contains("Editor Settings")').html('文字編輯器設定')
    pref.find('#editor-settings-note').html('以下為編輯文字時的相關設定。部分設定將會被各個程式語言的擴充套件覆寫。若要瀏覽程式語言的擴充套件設定，請到「<a class="link packages-open">已安裝的擴充套件</a>」卡片清單中選擇該語言的設定。')

    pref.find('label[for="editor.autoIndent"]').children('.setting-title').html('自動縮排')
    pref.find('label[for="editor.autoIndent"]').next('.setting-description').html('按下 Enter 鍵新增一行時，自動縮排打字游標，使對齊上一行。')

    pref.find('label[for="editor.autoIndentOnPaste"]').children('.setting-title').html('貼上時自動縮排')
    pref.find('label[for="editor.autoIndentOnPaste"]').next('.setting-description').html('根據上一行，自動縮排貼上的文字。')

    pref.find('label[for="editor.backUpBeforeSaving"]').children('.setting-title').html('自動備份')
    pref.find('label[for="editor.backUpBeforeSaving"]').next('.setting-description').html('產生一個暫時性的備份檔，以免存檔時萬一產生磁碟錯誤導致檔案遺失。')

    pref.find('label[for="editor.confirmCheckoutHeadRevision"]').children('.setting-title').html('確認是否讓 Checkout 變更 HEAD')
    pref.find('label[for="editor.confirmCheckoutHeadRevision"]').next('.setting-description').html('當執行 checkout 將變更 HEAD，或在最後一次 commit 後卻放棄當前檔案的變更時，跳出確認視窗。')

    pref.find('atom-text-editor[id="editor.fontFamily"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('編輯器字型')
    pref.find('atom-text-editor[id="editor.fontFamily"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('指定文字編輯器使用的字型家族名稱。')

    pref.find('atom-text-editor[id="editor.fontSize"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('文字大小')
    pref.find('atom-text-editor[id="editor.fontSize"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('文字編輯器內的文字高度，單位：像素 (px)')

    pref.find('atom-text-editor[id="editor.invisibles.cr"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('斷行 (Cr) 顯示為：')
    pref.find('atom-text-editor[id="editor.invisibles.cr"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('<code>顯示隱藏字元</code>設定打勾時，微軟格式的斷行將用以下字元表示。')

    pref.find('atom-text-editor[id="editor.invisibles.eol"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('斷行 (Eol) 顯示為：')
    pref.find('atom-text-editor[id="editor.invisibles.eol"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('<code>顯示隱藏字元</code>設定打勾時，\\n 格式的斷行將用以下字元表示。')

    pref.find('atom-text-editor[id="editor.invisibles.space"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('空白 (space) 顯示為：')
    pref.find('atom-text-editor[id="editor.invisibles.space"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('<code>顯示隱藏字元</code>設定打勾時，行首與行尾的空白將用以下字元表示。')

    pref.find('atom-text-editor[id="editor.invisibles.tab"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('定位點 (tab) 顯示為：')
    pref.find('atom-text-editor[id="editor.invisibles.tab"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('<code>顯示隱藏字元</code>設定打勾時，\\t 定位點將用以下字元表示。')

    pref.find('atom-text-editor[id="editor.lineHeight"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('行高')
    pref.find('atom-text-editor[id="editor.lineHeight"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('文字編輯器內的文字行高，是文字大小 (高度) 的倍數。')

    pref.find('atom-text-editor[id="editor.nonWordCharacters"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('不視為詞彙的符號')
    pref.find('atom-text-editor[id="editor.nonWordCharacters"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('下列符號將不被視為詞彙，而是拿來做為詞彙的邊界。')

    pref.find('atom-text-editor[id="editor.preferredLineLength"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('每一行的長度')
    pref.find('atom-text-editor[id="editor.preferredLineLength"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('<code>自動換行</code>設定打勾後，定義每一行自動換行的長度，單位：字元。')

    pref.find('label[for="editor.scrollPastEnd"]').children('.setting-title').html('捲過頭')
    pref.find('label[for="editor.scrollPastEnd"]').next('.setting-description').html('允許文字編輯器捲動超過最後一行。')

    pref.find('atom-text-editor[id="editor.scrollSensitivity"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('捲動速度')
    pref.find('atom-text-editor[id="editor.scrollSensitivity"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('指定文字編輯器裡使用滑鼠或觸控板捲動的速度。')

    pref.find('label[for="editor.showIndentGuide"]').children('.setting-title').html('顯示縮排對齊線')
    pref.find('label[for="editor.showIndentGuide"]').next('.setting-description').html('在文字編輯器中顯示縮排的對齊線。')

    pref.find('label[for="editor.showInvisibles"]').children('.setting-title').html('顯示隱藏字元')
    pref.find('label[for="editor.showInvisibles"]').next('.setting-description').html('在文字編輯器中顯示隱藏字元的代表符號，如定位點、空白或斷行。代表符號可以在上方的相關設定裡指定。')

    pref.find('label[for="editor.showLineNumbers"]').children('.setting-title').html('顯示行號')
    pref.find('label[for="editor.showLineNumbers"]').next('.setting-description').html('在文字編輯器的側面顯示行號。')

    pref.find('label[for="editor.softTabs"]').children('.setting-title').html('軟定位點')
    pref.find('label[for="editor.softTabs"]').next('.setting-description').html('如果<code>定位 (tab) 模式</code>設定為「自動判斷 (auto)」，而自動判斷結果卻失敗時，則當此設定打勾時，會改用「軟定位點 (soft)」，否則將用「硬定位點 (hard)」插入定位。')

    pref.find('label[for="editor.softWrap"]').children('.setting-title').html('自動換行')
    pref.find('label[for="editor.softWrap"]').next('.setting-description').html('文字長度超過視窗寬度時，自動換行。然而當<code>在指定長度換行</code>設定打勾時，換行長度將使用<code>每一行的長度</code>內的數字，而不是視窗寬度。')

    pref.find('label[for="editor.softWrapAtPreferredLineLength"]').children('.setting-title').html('在指定長度換行')
    pref.find('label[for="editor.softWrapAtPreferredLineLength"]').next('.setting-description').html('文字長度超過<code>每一行的長度</code>內的數字時，自動換行。這項設定只有在<code>自動換行</code>設定打勾時，或主選單 > 檢視 > 自動換行啟用時才有作用。')

    pref.find('atom-text-editor[id="editor.softWrapHangingIndent"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('自動換行時的凸排長度')
    pref.find('atom-text-editor[id="editor.softWrapHangingIndent"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('<code>自動換行</code>設定打勾時，第二行以下額外縮排的長度，單位：字元。')

    pref.find('select[id="editor.tabLength"]').prev('label').children('.setting-title').html('定位點 (tab) 長度')
    pref.find('select[id="editor.tabLength"]').prev('label').children('.setting-description').html('在此指定空白字元的數量，用以代表每個定位點 (tab) 的長度。')

    pref.find('select[id="editor.tabType"]').prev('label').children('.setting-title').html('定位 (tab) 模式')
    pref.find('select[id="editor.tabType"]').prev('label').children('.setting-description').html('當按下定位 (tab) 鍵時，插入的字元。有三種模式：「自動判斷 (auto)」、「軟定位點 (soft)」或 「硬定位點 (hard)」。「軟定位點」使用空白字元 (space)，「硬定位點」使用定位字元 (tab)。「自動判斷」模式將會使用該行行首的空白字元或定位字元。如果自動判斷失敗，將會直接採用<code>軟定位點</code>的設定。')

    pref.find('atom-text-editor[id="editor.undoGroupingInterval"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('多長時間內的數個復原動作將被合併？')
    pref.find('atom-text-editor[id="editor.undoGroupingInterval"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('編輯過程產生的復原動作歷史紀錄，將以此時間長度做合併，單位：毫秒。')

    pref.find('label[for="editor.useShadowDOM"]').children('.setting-title').html('啟用 Shadow DOM')
    pref.find('label[for="editor.useShadowDOM"]').next('.setting-description').html('如果您遇到擴充套件或者佈景主題在變更軟體外觀上的問題，請取消此設定，禁止 Atom 使用 Shadow DOM 產生元件。您也可以針對該擴充套件或佈景主題到 GitHub 提出 issue。(本設定之後將被廢棄。)')

    pref.find('label[for="editor.zoomFontWhenCtrlScrolling"]').children('.setting-title').html('使用 Ctrl + 滑鼠滾輪縮放文字大小')
    pref.find('label[for="editor.zoomFontWhenCtrlScrolling"]').next('.setting-description').html('使用 Ctrl 鍵和滑鼠滾輪上下捲動改變文字編輯器內的文字大小。')



localizeKeybindings = () ->
  $ = require 'jquery'
  pref = $('.settings-view')

  pref.find('.section-heading.icon.icon-keyboard:contains("Keybindings")').html('快速鍵設定')

  temp = pref.find('.keybinding-panel div.text.native-key-bindings').children()
  temp.eq(1).html('您能覆寫這些快速鍵設定。只要按下&nbsp;')
  temp.eq(3).html('圖示複製，並貼到您的&nbsp;')
  temp.eq(4).html('快速鍵設定檔&nbsp;')
  temp.eq(4).after('<span>中修改即可。</span>') if temp.length == 5

  pref.find('table th.keystroke').html('按鍵輸入')
  pref.find('table th.command').html('執行指令')
  pref.find('table th.source').html('來源')
  pref.find('table th.selector').html('選取器')



localizePackages = () ->
  $ = require 'jquery'
  pref = $('.settings-view')

  temp = pref.find('.section-heading.icon.icon-package:contains("Installed Packages")')
  temp.contents().first()[0].textContent='已安裝的擴充套件' if temp.length > 0

  temp = pref.find('.sub-section-heading.icon.icon-package:contains("Deprecated Packages")')
  temp.contents().first()[0].textContent='已過期的擴充套件' if temp.length > 0

  pref.find('section.sub-section.deprecated-packages p').html('Atom 不會載入過期的擴充套件。這些擴充套件可能提供更新。')

  temp = pref.find('.sub-section-heading.icon.icon-package:contains("Community Packages")')
  temp.contents().first()[0].textContent='來自社群的擴充套件' if temp.length > 0

  temp = pref.find('.sub-section-heading.icon.icon-package:contains("Core Packages")')
  temp.contents().first()[0].textContent='核心擴充套件' if temp.length > 0

  temp = pref.find('.sub-section-heading.icon.icon-package:contains("Development Packages")')
  temp.contents().first()[0].textContent='發展中的擴充套件' if temp.length > 0



localizeThemes = () ->
  $ = require 'jquery'
  pref = $('.settings-view')

  pref.find('.section-heading.icon.icon-device-desktop:contains("Choose a Theme")').html('選擇一個佈景主題')

  temp = pref.find('.themes-panel div.text.native-key-bindings').children()
  temp.eq(0).html('您也能直接修改&nbsp;')
  temp.eq(1).html('Atom 樣式表&nbsp;')
  temp.eq(1).after('<span>來手動調整外觀與顏色。</span>') if temp.length == 2

  pref.find('label > div.setting-title.themes-label.text').eq(0).html('介面的佈景主題')
  pref.find('label > div.setting-description.text.theme-description').eq(0).html('頁籤、狀態列、檔案清單面板、下拉選單的外觀。')

  pref.find('label > div.setting-title.themes-label.text').eq(1).html('語法的佈景主題')
  pref.find('label > div.setting-description.text.theme-description').eq(1).html('程式語法的顏色與文字編輯器的外觀。')

  temp = pref.find('.section-heading.icon.icon-paintcan:contains("Installed Themes")')
  temp.contents().first()[0].textContent='已安裝的佈景主題' if temp.length > 0

  temp = pref.find('.sub-section-heading.icon.icon-paintcan:contains("Community Themes")')
  temp.contents().first()[0].textContent='來自社群的佈景主題' if temp.length > 0

  temp = pref.find('.sub-section-heading.icon.icon-paintcan:contains("Core Themes")')
  temp.contents().first()[0].textContent='核心佈景主題' if temp.length > 0

  temp = pref.find('.sub-section-heading.icon.icon-paintcan:contains("Development Themes")')
  temp.contents().first()[0].textContent='發展中的佈景主題' if temp.length > 0



localizeUpdates = () ->
  $ = require 'jquery'
  pref = $('.settings-view')

  temp = pref.find('.section-heading.icon.icon-cloud-download:contains("Available Updates")')
  temp.contents().last()[0].textContent='可用的更新' if temp.length > 0

  pref.find('.alert-info.icon.icon-hourglass').html('檢查更新中...')
  pref.find('.alert-info.icon.icon-heart').html('您所有的擴充套件都已經是最新版本了。')





localizeInstall = () ->
  $ = require 'jquery'
  pref = $('.settings-view')






localizeButtons = () ->
  $ = require('jquery')
  pref = $('.settings-view')
  counter = 0
  si = setInterval((->
    if counter < 1 then counter++ else clearInterval si
    if pref.find('.package-container .btn-toolbar').length > 0
      pref.find('button:contains("Packages")').html('擴充套件');
      pref.find('button:contains("Themes")').html('佈景主題');
      pref.find('button:contains("Check for Updates")').html('檢查更新');
      pref.find('button:contains("更新全部")').html('安裝新版');
      pref.find('button:contains("Update")').html('更新');
      pref.find('button:contains("Install Alternative")').html('安裝新版');
      pref.find('button:contains("Install")').html('安裝');
      pref.find('button:contains("Settings")').html('設定');
      pref.find('button:contains("Uninstall")').html('移除');
      pref.find('button .disable-text:contains("Disable")').html('停用');
      pref.find('button .disable-text:contains("Enable")').html('啟用');
    return
  ), 0)
  return
