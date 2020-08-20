curl -LG \
      -d "mimeType=application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" \
      -H "Authorization: Bearer #{authorize.access_token}" \
      "https://www.googleapis.com/drive/v3/files/1cLpTjo4eUnBdsAgd5uIJk5qg2Z5ivxBQh-l0HvoPGyI/export" \
      -o "#{Rails.root.to_s}/xlsx-to-seed/src/ingame_master.xlsx"

curl -LG \
      -d "mimeType=application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" \
      -H "Authorization: Bearer #{authorize.access_token}" \
      "https://www.googleapis.com/drive/v3/files/1_tsgBVOIKMwUgO2P_vce5DEpA5MuxpMidpG0BhnzP88/export" \
      -o "#{Rails.root.to_s}/xlsx-to-seed/src/outgame_master.xlsx"
