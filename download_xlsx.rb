def GoogleSpreadSheetToExcel
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'google/api_client/client_secrets'
require 'google/apis/drive_v3'

   def download_excel
        client_id = Google::Auth::ClientId.from_file("./credentials.json")
        token_store = Google::Auth::Stores::FileTokenStore.new(file: "./tokens.json")
        scope = [
        Google::Apis::DriveV3::AUTH_DRIVE # NOTE: スプレッドシートをダウンロードするのに必要
        ]
        oob_uri = 'urn:ietf:wg:oauth:2.0:oob'
        authorizer = Google::Auth::UserAuthorizer.new(client_id, scope, token_store)
        user_id = 'default'
        credentials = authorizer.get_credentials(user_id)
        if credentials.nil?
        url = authorizer.get_authorization_url(base_url: oob_uri)
        puts 'Open the following URL in the browser and enter the ' \
            "resulting code after authorization:\n" + url
        code = gets
        credentials = authorizer.get_and_store_credentials_from_code(
            user_id: user_id, code: code, base_url: oob_uri
        )
        end
        authorize = credentials.fetch_access_token!
        # p authorize["access_token"]
        # p authorize.access_token
        ENV['ACCESS_TOKEN'] = authorize["access_token"]
        # dl ingame master data
        `curl -LG \
        -d "mimeType=application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" \
        -H "Authorization: Bearer #{authorize["access_token"]}" \
        "https://www.googleapis.com/drive/v3/files/1cLpTjo4eUnBdsAgd5uIJk5qg2Z5ivxBQh-l0HvoPGyI/export" \
        -o "./src/ingame_master.xlsx" `

        `curl -LG \
        -d "mimeType=application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" \
        -H "Authorization: Bearer #{authorize["access_token"]}" \
        "https://www.googleapis.com/drive/v3/files/1_tsgBVOIKMwUgO2P_vce5DEpA5MuxpMidpG0BhnzP88/export" \
        -o "./src/outgame_master.xlsx" `

    end
end
spread_sheet_to_excel = GoogleSpreadSheetToExcel()
spread_sheet_to_excel.download_excel
