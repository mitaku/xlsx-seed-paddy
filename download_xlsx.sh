curl -LG \
      -d "mimeType=application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" \
      -H "Authorization: Bearer ${access_token}" \
      "https://www.googleapis.com/drive/v3/files/1cLpTjo4eUnBdsAgd5uIJk5qg2Z5ivxBQh-l0HvoPGyI/export" \
      -o "./src/ingame_master.xlsx"

curl -LG \
      -d "mimeType=application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" \
      -H "Authorization: Bearer ${access_token}" \
      "https://www.googleapis.com/drive/v3/files/1_tsgBVOIKMwUgO2P_vce5DEpA5MuxpMidpG0BhnzP88/export" \
      -o "./src/outgame_master.xlsx"
