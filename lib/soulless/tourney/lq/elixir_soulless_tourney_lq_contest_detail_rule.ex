# credo:disable-for-this-file
defmodule Soulless.Tourney.Lq.ContestDetailRule do
  @moduledoc false
  defstruct init_point: 0,
            fandian: 0,
            can_jifei: false,
            tianbian_value: 0,
            liqibang_value: 0,
            changbang_value: 0,
            noting_fafu_1: 0,
            noting_fafu_2: 0,
            noting_fafu_3: 0,
            have_liujumanguan: false,
            have_qieshangmanguan: false,
            have_biao_dora: false,
            have_gang_biao_dora: false,
            ming_dora_immediately_open: false,
            have_li_dora: false,
            have_gang_li_dora: false,
            have_sifenglianda: false,
            have_sigangsanle: false,
            have_sijializhi: false,
            have_jiuzhongjiupai: false,
            have_sanjiahele: false,
            have_toutiao: false,
            have_helelianzhuang: false,
            have_helezhongju: false,
            have_tingpailianzhuang: false,
            have_tingpaizhongju: false,
            have_yifa: false,
            have_nanruxiru: false,
            jingsuanyuandian: 0,
            shunweima_2: 0,
            shunweima_3: 0,
            shunweima_4: 0,
            bianjietishi: false,
            ai_level: 0,
            have_zimosun: false,
            disable_multi_yukaman: false,
            guyi_mode: 0,
            disable_leijiyiman: false,
            dora3_mode: 0,
            xuezhandaodi: 0,
            huansanzhang: 0,
            chuanma: 0,
            disable_double_yakuman: 0,
            disable_composite_yakuman: 0,
            enable_shiti: 0,
            enable_nontsumo_liqi: 0,
            disable_double_wind_four_fu: 0,
            disable_angang_guoshi: 0,
            enable_renhe: 0,
            enable_baopai_extend_settings: 0,
            fanfu: 0,
            __uf__: []

  (
    (
      @spec encode(struct) :: {:ok, iodata} | {:error, any}
      def encode(msg) do
        try do
          {:ok, encode!(msg)}
        rescue
          e in [Protox.EncodingError, Protox.RequiredFieldsError] -> {:error, e}
        end
      end

      @spec encode!(struct) :: iodata | no_return
      def encode!(msg) do
        []
        |> encode_init_point(msg)
        |> encode_fandian(msg)
        |> encode_can_jifei(msg)
        |> encode_tianbian_value(msg)
        |> encode_liqibang_value(msg)
        |> encode_changbang_value(msg)
        |> encode_noting_fafu_1(msg)
        |> encode_noting_fafu_2(msg)
        |> encode_noting_fafu_3(msg)
        |> encode_have_liujumanguan(msg)
        |> encode_have_qieshangmanguan(msg)
        |> encode_have_biao_dora(msg)
        |> encode_have_gang_biao_dora(msg)
        |> encode_ming_dora_immediately_open(msg)
        |> encode_have_li_dora(msg)
        |> encode_have_gang_li_dora(msg)
        |> encode_have_sifenglianda(msg)
        |> encode_have_sigangsanle(msg)
        |> encode_have_sijializhi(msg)
        |> encode_have_jiuzhongjiupai(msg)
        |> encode_have_sanjiahele(msg)
        |> encode_have_toutiao(msg)
        |> encode_have_helelianzhuang(msg)
        |> encode_have_helezhongju(msg)
        |> encode_have_tingpailianzhuang(msg)
        |> encode_have_tingpaizhongju(msg)
        |> encode_have_yifa(msg)
        |> encode_have_nanruxiru(msg)
        |> encode_jingsuanyuandian(msg)
        |> encode_shunweima_2(msg)
        |> encode_shunweima_3(msg)
        |> encode_shunweima_4(msg)
        |> encode_bianjietishi(msg)
        |> encode_ai_level(msg)
        |> encode_have_zimosun(msg)
        |> encode_disable_multi_yukaman(msg)
        |> encode_guyi_mode(msg)
        |> encode_disable_leijiyiman(msg)
        |> encode_dora3_mode(msg)
        |> encode_xuezhandaodi(msg)
        |> encode_huansanzhang(msg)
        |> encode_chuanma(msg)
        |> encode_disable_double_yakuman(msg)
        |> encode_disable_composite_yakuman(msg)
        |> encode_enable_shiti(msg)
        |> encode_enable_nontsumo_liqi(msg)
        |> encode_disable_double_wind_four_fu(msg)
        |> encode_disable_angang_guoshi(msg)
        |> encode_enable_renhe(msg)
        |> encode_enable_baopai_extend_settings(msg)
        |> encode_fanfu(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_init_point(acc, msg) do
        try do
          if msg.init_point == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_uint32(msg.init_point)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:init_point, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_fandian(acc, msg) do
        try do
          if msg.fandian == 0 do
            acc
          else
            [acc, "0", Protox.Encode.encode_uint32(msg.fandian)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:fandian, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_can_jifei(acc, msg) do
        try do
          if msg.can_jifei == false do
            acc
          else
            [acc, "8", Protox.Encode.encode_bool(msg.can_jifei)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:can_jifei, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_tianbian_value(acc, msg) do
        try do
          if msg.tianbian_value == 0 do
            acc
          else
            [acc, "@", Protox.Encode.encode_uint32(msg.tianbian_value)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:tianbian_value, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_liqibang_value(acc, msg) do
        try do
          if msg.liqibang_value == 0 do
            acc
          else
            [acc, "H", Protox.Encode.encode_uint32(msg.liqibang_value)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:liqibang_value, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_changbang_value(acc, msg) do
        try do
          if msg.changbang_value == 0 do
            acc
          else
            [acc, "P", Protox.Encode.encode_uint32(msg.changbang_value)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:changbang_value, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_noting_fafu_1(acc, msg) do
        try do
          if msg.noting_fafu_1 == 0 do
            acc
          else
            [acc, "X", Protox.Encode.encode_uint32(msg.noting_fafu_1)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:noting_fafu_1, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_noting_fafu_2(acc, msg) do
        try do
          if msg.noting_fafu_2 == 0 do
            acc
          else
            [acc, "`", Protox.Encode.encode_uint32(msg.noting_fafu_2)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:noting_fafu_2, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_noting_fafu_3(acc, msg) do
        try do
          if msg.noting_fafu_3 == 0 do
            acc
          else
            [acc, "h", Protox.Encode.encode_uint32(msg.noting_fafu_3)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:noting_fafu_3, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_have_liujumanguan(acc, msg) do
        try do
          if msg.have_liujumanguan == false do
            acc
          else
            [acc, "p", Protox.Encode.encode_bool(msg.have_liujumanguan)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:have_liujumanguan, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_have_qieshangmanguan(acc, msg) do
        try do
          if msg.have_qieshangmanguan == false do
            acc
          else
            [acc, "x", Protox.Encode.encode_bool(msg.have_qieshangmanguan)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:have_qieshangmanguan, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_have_biao_dora(acc, msg) do
        try do
          if msg.have_biao_dora == false do
            acc
          else
            [acc, "\x80\x01", Protox.Encode.encode_bool(msg.have_biao_dora)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:have_biao_dora, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_have_gang_biao_dora(acc, msg) do
        try do
          if msg.have_gang_biao_dora == false do
            acc
          else
            [acc, "\x88\x01", Protox.Encode.encode_bool(msg.have_gang_biao_dora)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:have_gang_biao_dora, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_ming_dora_immediately_open(acc, msg) do
        try do
          if msg.ming_dora_immediately_open == false do
            acc
          else
            [acc, "\x90\x01", Protox.Encode.encode_bool(msg.ming_dora_immediately_open)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ming_dora_immediately_open, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_have_li_dora(acc, msg) do
        try do
          if msg.have_li_dora == false do
            acc
          else
            [acc, "\x98\x01", Protox.Encode.encode_bool(msg.have_li_dora)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:have_li_dora, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_have_gang_li_dora(acc, msg) do
        try do
          if msg.have_gang_li_dora == false do
            acc
          else
            [acc, "\xA0\x01", Protox.Encode.encode_bool(msg.have_gang_li_dora)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:have_gang_li_dora, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_have_sifenglianda(acc, msg) do
        try do
          if msg.have_sifenglianda == false do
            acc
          else
            [acc, "\xA8\x01", Protox.Encode.encode_bool(msg.have_sifenglianda)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:have_sifenglianda, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_have_sigangsanle(acc, msg) do
        try do
          if msg.have_sigangsanle == false do
            acc
          else
            [acc, "\xB0\x01", Protox.Encode.encode_bool(msg.have_sigangsanle)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:have_sigangsanle, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_have_sijializhi(acc, msg) do
        try do
          if msg.have_sijializhi == false do
            acc
          else
            [acc, "\xB8\x01", Protox.Encode.encode_bool(msg.have_sijializhi)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:have_sijializhi, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_have_jiuzhongjiupai(acc, msg) do
        try do
          if msg.have_jiuzhongjiupai == false do
            acc
          else
            [acc, "\xC0\x01", Protox.Encode.encode_bool(msg.have_jiuzhongjiupai)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:have_jiuzhongjiupai, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_have_sanjiahele(acc, msg) do
        try do
          if msg.have_sanjiahele == false do
            acc
          else
            [acc, "\xC8\x01", Protox.Encode.encode_bool(msg.have_sanjiahele)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:have_sanjiahele, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_have_toutiao(acc, msg) do
        try do
          if msg.have_toutiao == false do
            acc
          else
            [acc, "\xD0\x01", Protox.Encode.encode_bool(msg.have_toutiao)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:have_toutiao, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_have_helelianzhuang(acc, msg) do
        try do
          if msg.have_helelianzhuang == false do
            acc
          else
            [acc, "\xD8\x01", Protox.Encode.encode_bool(msg.have_helelianzhuang)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:have_helelianzhuang, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_have_helezhongju(acc, msg) do
        try do
          if msg.have_helezhongju == false do
            acc
          else
            [acc, "\xE0\x01", Protox.Encode.encode_bool(msg.have_helezhongju)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:have_helezhongju, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_have_tingpailianzhuang(acc, msg) do
        try do
          if msg.have_tingpailianzhuang == false do
            acc
          else
            [acc, "\xE8\x01", Protox.Encode.encode_bool(msg.have_tingpailianzhuang)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:have_tingpailianzhuang, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_have_tingpaizhongju(acc, msg) do
        try do
          if msg.have_tingpaizhongju == false do
            acc
          else
            [acc, "\xF0\x01", Protox.Encode.encode_bool(msg.have_tingpaizhongju)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:have_tingpaizhongju, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_have_yifa(acc, msg) do
        try do
          if msg.have_yifa == false do
            acc
          else
            [acc, "\xF8\x01", Protox.Encode.encode_bool(msg.have_yifa)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:have_yifa, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_have_nanruxiru(acc, msg) do
        try do
          if msg.have_nanruxiru == false do
            acc
          else
            [acc, "\x80\x02", Protox.Encode.encode_bool(msg.have_nanruxiru)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:have_nanruxiru, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_jingsuanyuandian(acc, msg) do
        try do
          if msg.jingsuanyuandian == 0 do
            acc
          else
            [acc, "\x88\x02", Protox.Encode.encode_uint32(msg.jingsuanyuandian)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:jingsuanyuandian, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_shunweima_2(acc, msg) do
        try do
          if msg.shunweima_2 == 0 do
            acc
          else
            [acc, "\x90\x02", Protox.Encode.encode_int32(msg.shunweima_2)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:shunweima_2, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_shunweima_3(acc, msg) do
        try do
          if msg.shunweima_3 == 0 do
            acc
          else
            [acc, "\x98\x02", Protox.Encode.encode_int32(msg.shunweima_3)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:shunweima_3, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_shunweima_4(acc, msg) do
        try do
          if msg.shunweima_4 == 0 do
            acc
          else
            [acc, "\xA0\x02", Protox.Encode.encode_int32(msg.shunweima_4)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:shunweima_4, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_bianjietishi(acc, msg) do
        try do
          if msg.bianjietishi == false do
            acc
          else
            [acc, "\xA8\x02", Protox.Encode.encode_bool(msg.bianjietishi)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:bianjietishi, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_ai_level(acc, msg) do
        try do
          if msg.ai_level == 0 do
            acc
          else
            [acc, "\xB0\x02", Protox.Encode.encode_uint32(msg.ai_level)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ai_level, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_have_zimosun(acc, msg) do
        try do
          if msg.have_zimosun == false do
            acc
          else
            [acc, "\xB8\x02", Protox.Encode.encode_bool(msg.have_zimosun)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:have_zimosun, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_disable_multi_yukaman(acc, msg) do
        try do
          if msg.disable_multi_yukaman == false do
            acc
          else
            [acc, "\xC0\x02", Protox.Encode.encode_bool(msg.disable_multi_yukaman)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:disable_multi_yukaman, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_guyi_mode(acc, msg) do
        try do
          if msg.guyi_mode == 0 do
            acc
          else
            [acc, "\xC8\x02", Protox.Encode.encode_uint32(msg.guyi_mode)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:guyi_mode, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_disable_leijiyiman(acc, msg) do
        try do
          if msg.disable_leijiyiman == false do
            acc
          else
            [acc, "\xD0\x02", Protox.Encode.encode_bool(msg.disable_leijiyiman)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:disable_leijiyiman, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_dora3_mode(acc, msg) do
        try do
          if msg.dora3_mode == 0 do
            acc
          else
            [acc, "\xD8\x02", Protox.Encode.encode_uint32(msg.dora3_mode)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:dora3_mode, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_xuezhandaodi(acc, msg) do
        try do
          if msg.xuezhandaodi == 0 do
            acc
          else
            [acc, "\xE0\x02", Protox.Encode.encode_uint32(msg.xuezhandaodi)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:xuezhandaodi, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_huansanzhang(acc, msg) do
        try do
          if msg.huansanzhang == 0 do
            acc
          else
            [acc, "\xE8\x02", Protox.Encode.encode_uint32(msg.huansanzhang)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:huansanzhang, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_chuanma(acc, msg) do
        try do
          if msg.chuanma == 0 do
            acc
          else
            [acc, "\xF0\x02", Protox.Encode.encode_uint32(msg.chuanma)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:chuanma, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_disable_double_yakuman(acc, msg) do
        try do
          if msg.disable_double_yakuman == 0 do
            acc
          else
            [acc, "\xF0\x03", Protox.Encode.encode_uint32(msg.disable_double_yakuman)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:disable_double_yakuman, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_disable_composite_yakuman(acc, msg) do
        try do
          if msg.disable_composite_yakuman == 0 do
            acc
          else
            [acc, "\xF8\x03", Protox.Encode.encode_uint32(msg.disable_composite_yakuman)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:disable_composite_yakuman, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_enable_shiti(acc, msg) do
        try do
          if msg.enable_shiti == 0 do
            acc
          else
            [acc, "\x80\x04", Protox.Encode.encode_uint32(msg.enable_shiti)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:enable_shiti, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_enable_nontsumo_liqi(acc, msg) do
        try do
          if msg.enable_nontsumo_liqi == 0 do
            acc
          else
            [acc, "\x88\x04", Protox.Encode.encode_uint32(msg.enable_nontsumo_liqi)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:enable_nontsumo_liqi, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_disable_double_wind_four_fu(acc, msg) do
        try do
          if msg.disable_double_wind_four_fu == 0 do
            acc
          else
            [acc, "\x90\x04", Protox.Encode.encode_uint32(msg.disable_double_wind_four_fu)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:disable_double_wind_four_fu, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_disable_angang_guoshi(acc, msg) do
        try do
          if msg.disable_angang_guoshi == 0 do
            acc
          else
            [acc, "\x98\x04", Protox.Encode.encode_uint32(msg.disable_angang_guoshi)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:disable_angang_guoshi, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_enable_renhe(acc, msg) do
        try do
          if msg.enable_renhe == 0 do
            acc
          else
            [acc, "\xA0\x04", Protox.Encode.encode_uint32(msg.enable_renhe)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:enable_renhe, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_enable_baopai_extend_settings(acc, msg) do
        try do
          if msg.enable_baopai_extend_settings == 0 do
            acc
          else
            [acc, "\xA8\x04", Protox.Encode.encode_uint32(msg.enable_baopai_extend_settings)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(
                      :enable_baopai_extend_settings,
                      "invalid field value"
                    ),
                    __STACKTRACE__
        end
      end,
      defp encode_fanfu(acc, msg) do
        try do
          if msg.fanfu == 0 do
            acc
          else
            [acc, "\xB0\x04", Protox.Encode.encode_uint32(msg.fanfu)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:fanfu, "invalid field value"), __STACKTRACE__
        end
      end
    ]

    defp encode_unknown_fields(acc, msg) do
      Enum.reduce(msg.__struct__.unknown_fields(msg), acc, fn {tag, wire_type, bytes}, acc ->
        case wire_type do
          0 ->
            [acc, Protox.Encode.make_key_bytes(tag, :int32), bytes]

          1 ->
            [acc, Protox.Encode.make_key_bytes(tag, :double), bytes]

          2 ->
            len_bytes = bytes |> byte_size() |> Protox.Varint.encode()
            [acc, Protox.Encode.make_key_bytes(tag, :packed), len_bytes, bytes]

          5 ->
            [acc, Protox.Encode.make_key_bytes(tag, :float), bytes]
        end
      end)
    end
  )

  (
    (
      @spec decode(binary) :: {:ok, struct} | {:error, any}
      def decode(bytes) do
        try do
          {:ok, decode!(bytes)}
        rescue
          e in [Protox.DecodingError, Protox.IllegalTagError, Protox.RequiredFieldsError] ->
            {:error, e}
        end
      end

      (
        @spec decode!(binary) :: struct | no_return
        def decode!(bytes) do
          parse_key_value(bytes, struct(Soulless.Tourney.Lq.ContestDetailRule))
        end
      )
    )

    (
      @spec parse_key_value(binary, struct) :: struct
      defp parse_key_value(<<>>, msg) do
        msg
      end

      defp parse_key_value(bytes, msg) do
        {field, rest} =
          case Protox.Decode.parse_key(bytes) do
            {0, _, _} ->
              raise %Protox.IllegalTagError{}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[init_point: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[fandian: value], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[can_jifei: value], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[tianbian_value: value], rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[liqibang_value: value], rest}

            {10, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[changbang_value: value], rest}

            {11, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[noting_fafu_1: value], rest}

            {12, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[noting_fafu_2: value], rest}

            {13, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[noting_fafu_3: value], rest}

            {14, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[have_liujumanguan: value], rest}

            {15, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[have_qieshangmanguan: value], rest}

            {16, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[have_biao_dora: value], rest}

            {17, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[have_gang_biao_dora: value], rest}

            {18, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[ming_dora_immediately_open: value], rest}

            {19, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[have_li_dora: value], rest}

            {20, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[have_gang_li_dora: value], rest}

            {21, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[have_sifenglianda: value], rest}

            {22, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[have_sigangsanle: value], rest}

            {23, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[have_sijializhi: value], rest}

            {24, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[have_jiuzhongjiupai: value], rest}

            {25, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[have_sanjiahele: value], rest}

            {26, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[have_toutiao: value], rest}

            {27, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[have_helelianzhuang: value], rest}

            {28, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[have_helezhongju: value], rest}

            {29, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[have_tingpailianzhuang: value], rest}

            {30, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[have_tingpaizhongju: value], rest}

            {31, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[have_yifa: value], rest}

            {32, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[have_nanruxiru: value], rest}

            {33, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[jingsuanyuandian: value], rest}

            {34, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[shunweima_2: value], rest}

            {35, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[shunweima_3: value], rest}

            {36, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[shunweima_4: value], rest}

            {37, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[bianjietishi: value], rest}

            {38, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[ai_level: value], rest}

            {39, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[have_zimosun: value], rest}

            {40, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[disable_multi_yukaman: value], rest}

            {41, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[guyi_mode: value], rest}

            {42, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[disable_leijiyiman: value], rest}

            {43, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[dora3_mode: value], rest}

            {44, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[xuezhandaodi: value], rest}

            {45, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[huansanzhang: value], rest}

            {46, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[chuanma: value], rest}

            {62, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[disable_double_yakuman: value], rest}

            {63, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[disable_composite_yakuman: value], rest}

            {64, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[enable_shiti: value], rest}

            {65, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[enable_nontsumo_liqi: value], rest}

            {66, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[disable_double_wind_four_fu: value], rest}

            {67, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[disable_angang_guoshi: value], rest}

            {68, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[enable_renhe: value], rest}

            {69, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[enable_baopai_extend_settings: value], rest}

            {70, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[fanfu: value], rest}

            {tag, wire_type, rest} ->
              {value, rest} = Protox.Decode.parse_unknown(tag, wire_type, rest)

              {[
                 {msg.__struct__.unknown_fields_name,
                  [value | msg.__struct__.unknown_fields(msg)]}
               ], rest}
          end

        msg_updated = struct(msg, field)
        parse_key_value(rest, msg_updated)
      end
    )

    []
  )

  (
    @spec json_decode(iodata(), keyword()) :: {:ok, struct()} | {:error, any()}
    def json_decode(input, opts \\ []) do
      try do
        {:ok, json_decode!(input, opts)}
      rescue
        e in Protox.JsonDecodingError -> {:error, e}
      end
    end

    @spec json_decode!(iodata(), keyword()) :: struct() | no_return()
    def json_decode!(input, opts \\ []) do
      {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :decode)

      Protox.JsonDecode.decode!(
        input,
        Soulless.Tourney.Lq.ContestDetailRule,
        &json_library_wrapper.decode!(json_library, &1)
      )
    end

    @spec json_encode(struct(), keyword()) :: {:ok, iodata()} | {:error, any()}
    def json_encode(msg, opts \\ []) do
      try do
        {:ok, json_encode!(msg, opts)}
      rescue
        e in Protox.JsonEncodingError -> {:error, e}
      end
    end

    @spec json_encode!(struct(), keyword()) :: iodata() | no_return()
    def json_encode!(msg, opts \\ []) do
      {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :encode)
      Protox.JsonEncode.encode!(msg, &json_library_wrapper.encode!(json_library, &1))
    end
  )

  (
    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs() do
      %{
        33 => {:jingsuanyuandian, {:scalar, 0}, :uint32},
        12 => {:noting_fafu_2, {:scalar, 0}, :uint32},
        44 => {:xuezhandaodi, {:scalar, 0}, :uint32},
        23 => {:have_sijializhi, {:scalar, false}, :bool},
        29 => {:have_tingpailianzhuang, {:scalar, false}, :bool},
        30 => {:have_tingpaizhongju, {:scalar, false}, :bool},
        43 => {:dora3_mode, {:scalar, 0}, :uint32},
        39 => {:have_zimosun, {:scalar, false}, :bool},
        45 => {:huansanzhang, {:scalar, 0}, :uint32},
        26 => {:have_toutiao, {:scalar, false}, :bool},
        69 => {:enable_baopai_extend_settings, {:scalar, 0}, :uint32},
        63 => {:disable_composite_yakuman, {:scalar, 0}, :uint32},
        46 => {:chuanma, {:scalar, 0}, :uint32},
        31 => {:have_yifa, {:scalar, false}, :bool},
        11 => {:noting_fafu_1, {:scalar, 0}, :uint32},
        37 => {:bianjietishi, {:scalar, false}, :bool},
        9 => {:liqibang_value, {:scalar, 0}, :uint32},
        32 => {:have_nanruxiru, {:scalar, false}, :bool},
        34 => {:shunweima_2, {:scalar, 0}, :int32},
        25 => {:have_sanjiahele, {:scalar, false}, :bool},
        28 => {:have_helezhongju, {:scalar, false}, :bool},
        64 => {:enable_shiti, {:scalar, 0}, :uint32},
        6 => {:fandian, {:scalar, 0}, :uint32},
        68 => {:enable_renhe, {:scalar, 0}, :uint32},
        38 => {:ai_level, {:scalar, 0}, :uint32},
        13 => {:noting_fafu_3, {:scalar, 0}, :uint32},
        40 => {:disable_multi_yukaman, {:scalar, false}, :bool},
        41 => {:guyi_mode, {:scalar, 0}, :uint32},
        20 => {:have_gang_li_dora, {:scalar, false}, :bool},
        15 => {:have_qieshangmanguan, {:scalar, false}, :bool},
        14 => {:have_liujumanguan, {:scalar, false}, :bool},
        7 => {:can_jifei, {:scalar, false}, :bool},
        8 => {:tianbian_value, {:scalar, 0}, :uint32},
        17 => {:have_gang_biao_dora, {:scalar, false}, :bool},
        22 => {:have_sigangsanle, {:scalar, false}, :bool},
        21 => {:have_sifenglianda, {:scalar, false}, :bool},
        36 => {:shunweima_4, {:scalar, 0}, :int32},
        66 => {:disable_double_wind_four_fu, {:scalar, 0}, :uint32},
        24 => {:have_jiuzhongjiupai, {:scalar, false}, :bool},
        10 => {:changbang_value, {:scalar, 0}, :uint32},
        35 => {:shunweima_3, {:scalar, 0}, :int32},
        70 => {:fanfu, {:scalar, 0}, :uint32},
        62 => {:disable_double_yakuman, {:scalar, 0}, :uint32},
        27 => {:have_helelianzhuang, {:scalar, false}, :bool},
        42 => {:disable_leijiyiman, {:scalar, false}, :bool},
        19 => {:have_li_dora, {:scalar, false}, :bool},
        67 => {:disable_angang_guoshi, {:scalar, 0}, :uint32},
        65 => {:enable_nontsumo_liqi, {:scalar, 0}, :uint32},
        5 => {:init_point, {:scalar, 0}, :uint32},
        18 => {:ming_dora_immediately_open, {:scalar, false}, :bool},
        16 => {:have_biao_dora, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        have_tingpaizhongju: {30, {:scalar, false}, :bool},
        have_biao_dora: {16, {:scalar, false}, :bool},
        shunweima_3: {35, {:scalar, 0}, :int32},
        have_gang_biao_dora: {17, {:scalar, false}, :bool},
        shunweima_2: {34, {:scalar, 0}, :int32},
        have_sijializhi: {23, {:scalar, false}, :bool},
        guyi_mode: {41, {:scalar, 0}, :uint32},
        noting_fafu_2: {12, {:scalar, 0}, :uint32},
        have_sigangsanle: {22, {:scalar, false}, :bool},
        bianjietishi: {37, {:scalar, false}, :bool},
        have_gang_li_dora: {20, {:scalar, false}, :bool},
        have_helezhongju: {28, {:scalar, false}, :bool},
        can_jifei: {7, {:scalar, false}, :bool},
        have_tingpailianzhuang: {29, {:scalar, false}, :bool},
        disable_multi_yukaman: {40, {:scalar, false}, :bool},
        disable_double_wind_four_fu: {66, {:scalar, 0}, :uint32},
        enable_nontsumo_liqi: {65, {:scalar, 0}, :uint32},
        liqibang_value: {9, {:scalar, 0}, :uint32},
        have_toutiao: {26, {:scalar, false}, :bool},
        changbang_value: {10, {:scalar, 0}, :uint32},
        disable_angang_guoshi: {67, {:scalar, 0}, :uint32},
        tianbian_value: {8, {:scalar, 0}, :uint32},
        disable_double_yakuman: {62, {:scalar, 0}, :uint32},
        have_sanjiahele: {25, {:scalar, false}, :bool},
        have_nanruxiru: {32, {:scalar, false}, :bool},
        ai_level: {38, {:scalar, 0}, :uint32},
        disable_leijiyiman: {42, {:scalar, false}, :bool},
        shunweima_4: {36, {:scalar, 0}, :int32},
        dora3_mode: {43, {:scalar, 0}, :uint32},
        have_li_dora: {19, {:scalar, false}, :bool},
        xuezhandaodi: {44, {:scalar, 0}, :uint32},
        enable_renhe: {68, {:scalar, 0}, :uint32},
        fanfu: {70, {:scalar, 0}, :uint32},
        have_jiuzhongjiupai: {24, {:scalar, false}, :bool},
        have_yifa: {31, {:scalar, false}, :bool},
        init_point: {5, {:scalar, 0}, :uint32},
        ming_dora_immediately_open: {18, {:scalar, false}, :bool},
        have_zimosun: {39, {:scalar, false}, :bool},
        huansanzhang: {45, {:scalar, 0}, :uint32},
        have_qieshangmanguan: {15, {:scalar, false}, :bool},
        disable_composite_yakuman: {63, {:scalar, 0}, :uint32},
        enable_baopai_extend_settings: {69, {:scalar, 0}, :uint32},
        have_helelianzhuang: {27, {:scalar, false}, :bool},
        fandian: {6, {:scalar, 0}, :uint32},
        chuanma: {46, {:scalar, 0}, :uint32},
        jingsuanyuandian: {33, {:scalar, 0}, :uint32},
        have_liujumanguan: {14, {:scalar, false}, :bool},
        noting_fafu_3: {13, {:scalar, 0}, :uint32},
        enable_shiti: {64, {:scalar, 0}, :uint32},
        noting_fafu_1: {11, {:scalar, 0}, :uint32},
        have_sifenglianda: {21, {:scalar, false}, :bool}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "initPoint",
          kind: {:scalar, 0},
          label: :optional,
          name: :init_point,
          tag: 5,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "fandian",
          kind: {:scalar, 0},
          label: :optional,
          name: :fandian,
          tag: 6,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "canJifei",
          kind: {:scalar, false},
          label: :optional,
          name: :can_jifei,
          tag: 7,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "tianbianValue",
          kind: {:scalar, 0},
          label: :optional,
          name: :tianbian_value,
          tag: 8,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "liqibangValue",
          kind: {:scalar, 0},
          label: :optional,
          name: :liqibang_value,
          tag: 9,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "changbangValue",
          kind: {:scalar, 0},
          label: :optional,
          name: :changbang_value,
          tag: 10,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "notingFafu1",
          kind: {:scalar, 0},
          label: :optional,
          name: :noting_fafu_1,
          tag: 11,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "notingFafu2",
          kind: {:scalar, 0},
          label: :optional,
          name: :noting_fafu_2,
          tag: 12,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "notingFafu3",
          kind: {:scalar, 0},
          label: :optional,
          name: :noting_fafu_3,
          tag: 13,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "haveLiujumanguan",
          kind: {:scalar, false},
          label: :optional,
          name: :have_liujumanguan,
          tag: 14,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "haveQieshangmanguan",
          kind: {:scalar, false},
          label: :optional,
          name: :have_qieshangmanguan,
          tag: 15,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "haveBiaoDora",
          kind: {:scalar, false},
          label: :optional,
          name: :have_biao_dora,
          tag: 16,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "haveGangBiaoDora",
          kind: {:scalar, false},
          label: :optional,
          name: :have_gang_biao_dora,
          tag: 17,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "mingDoraImmediatelyOpen",
          kind: {:scalar, false},
          label: :optional,
          name: :ming_dora_immediately_open,
          tag: 18,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "haveLiDora",
          kind: {:scalar, false},
          label: :optional,
          name: :have_li_dora,
          tag: 19,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "haveGangLiDora",
          kind: {:scalar, false},
          label: :optional,
          name: :have_gang_li_dora,
          tag: 20,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "haveSifenglianda",
          kind: {:scalar, false},
          label: :optional,
          name: :have_sifenglianda,
          tag: 21,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "haveSigangsanle",
          kind: {:scalar, false},
          label: :optional,
          name: :have_sigangsanle,
          tag: 22,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "haveSijializhi",
          kind: {:scalar, false},
          label: :optional,
          name: :have_sijializhi,
          tag: 23,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "haveJiuzhongjiupai",
          kind: {:scalar, false},
          label: :optional,
          name: :have_jiuzhongjiupai,
          tag: 24,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "haveSanjiahele",
          kind: {:scalar, false},
          label: :optional,
          name: :have_sanjiahele,
          tag: 25,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "haveToutiao",
          kind: {:scalar, false},
          label: :optional,
          name: :have_toutiao,
          tag: 26,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "haveHelelianzhuang",
          kind: {:scalar, false},
          label: :optional,
          name: :have_helelianzhuang,
          tag: 27,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "haveHelezhongju",
          kind: {:scalar, false},
          label: :optional,
          name: :have_helezhongju,
          tag: 28,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "haveTingpailianzhuang",
          kind: {:scalar, false},
          label: :optional,
          name: :have_tingpailianzhuang,
          tag: 29,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "haveTingpaizhongju",
          kind: {:scalar, false},
          label: :optional,
          name: :have_tingpaizhongju,
          tag: 30,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "haveYifa",
          kind: {:scalar, false},
          label: :optional,
          name: :have_yifa,
          tag: 31,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "haveNanruxiru",
          kind: {:scalar, false},
          label: :optional,
          name: :have_nanruxiru,
          tag: 32,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "jingsuanyuandian",
          kind: {:scalar, 0},
          label: :optional,
          name: :jingsuanyuandian,
          tag: 33,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "shunweima2",
          kind: {:scalar, 0},
          label: :optional,
          name: :shunweima_2,
          tag: 34,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "shunweima3",
          kind: {:scalar, 0},
          label: :optional,
          name: :shunweima_3,
          tag: 35,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "shunweima4",
          kind: {:scalar, 0},
          label: :optional,
          name: :shunweima_4,
          tag: 36,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "bianjietishi",
          kind: {:scalar, false},
          label: :optional,
          name: :bianjietishi,
          tag: 37,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "aiLevel",
          kind: {:scalar, 0},
          label: :optional,
          name: :ai_level,
          tag: 38,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "haveZimosun",
          kind: {:scalar, false},
          label: :optional,
          name: :have_zimosun,
          tag: 39,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "disableMultiYukaman",
          kind: {:scalar, false},
          label: :optional,
          name: :disable_multi_yukaman,
          tag: 40,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "guyiMode",
          kind: {:scalar, 0},
          label: :optional,
          name: :guyi_mode,
          tag: 41,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "disableLeijiyiman",
          kind: {:scalar, false},
          label: :optional,
          name: :disable_leijiyiman,
          tag: 42,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "dora3Mode",
          kind: {:scalar, 0},
          label: :optional,
          name: :dora3_mode,
          tag: 43,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "xuezhandaodi",
          kind: {:scalar, 0},
          label: :optional,
          name: :xuezhandaodi,
          tag: 44,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "huansanzhang",
          kind: {:scalar, 0},
          label: :optional,
          name: :huansanzhang,
          tag: 45,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "chuanma",
          kind: {:scalar, 0},
          label: :optional,
          name: :chuanma,
          tag: 46,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "disableDoubleYakuman",
          kind: {:scalar, 0},
          label: :optional,
          name: :disable_double_yakuman,
          tag: 62,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "disableCompositeYakuman",
          kind: {:scalar, 0},
          label: :optional,
          name: :disable_composite_yakuman,
          tag: 63,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "enableShiti",
          kind: {:scalar, 0},
          label: :optional,
          name: :enable_shiti,
          tag: 64,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "enableNontsumoLiqi",
          kind: {:scalar, 0},
          label: :optional,
          name: :enable_nontsumo_liqi,
          tag: 65,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "disableDoubleWindFourFu",
          kind: {:scalar, 0},
          label: :optional,
          name: :disable_double_wind_four_fu,
          tag: 66,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "disableAngangGuoshi",
          kind: {:scalar, 0},
          label: :optional,
          name: :disable_angang_guoshi,
          tag: 67,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "enableRenhe",
          kind: {:scalar, 0},
          label: :optional,
          name: :enable_renhe,
          tag: 68,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "enableBaopaiExtendSettings",
          kind: {:scalar, 0},
          label: :optional,
          name: :enable_baopai_extend_settings,
          tag: 69,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "fanfu",
          kind: {:scalar, 0},
          label: :optional,
          name: :fanfu,
          tag: 70,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:init_point) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "initPoint",
             kind: {:scalar, 0},
             label: :optional,
             name: :init_point,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("initPoint") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "initPoint",
             kind: {:scalar, 0},
             label: :optional,
             name: :init_point,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("init_point") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "initPoint",
             kind: {:scalar, 0},
             label: :optional,
             name: :init_point,
             tag: 5,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:fandian) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fandian",
             kind: {:scalar, 0},
             label: :optional,
             name: :fandian,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("fandian") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fandian",
             kind: {:scalar, 0},
             label: :optional,
             name: :fandian,
             tag: 6,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:can_jifei) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "canJifei",
             kind: {:scalar, false},
             label: :optional,
             name: :can_jifei,
             tag: 7,
             type: :bool
           }}
        end

        def field_def("canJifei") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "canJifei",
             kind: {:scalar, false},
             label: :optional,
             name: :can_jifei,
             tag: 7,
             type: :bool
           }}
        end

        def field_def("can_jifei") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "canJifei",
             kind: {:scalar, false},
             label: :optional,
             name: :can_jifei,
             tag: 7,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:tianbian_value) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tianbianValue",
             kind: {:scalar, 0},
             label: :optional,
             name: :tianbian_value,
             tag: 8,
             type: :uint32
           }}
        end

        def field_def("tianbianValue") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tianbianValue",
             kind: {:scalar, 0},
             label: :optional,
             name: :tianbian_value,
             tag: 8,
             type: :uint32
           }}
        end

        def field_def("tianbian_value") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tianbianValue",
             kind: {:scalar, 0},
             label: :optional,
             name: :tianbian_value,
             tag: 8,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:liqibang_value) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqibangValue",
             kind: {:scalar, 0},
             label: :optional,
             name: :liqibang_value,
             tag: 9,
             type: :uint32
           }}
        end

        def field_def("liqibangValue") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqibangValue",
             kind: {:scalar, 0},
             label: :optional,
             name: :liqibang_value,
             tag: 9,
             type: :uint32
           }}
        end

        def field_def("liqibang_value") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqibangValue",
             kind: {:scalar, 0},
             label: :optional,
             name: :liqibang_value,
             tag: 9,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:changbang_value) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "changbangValue",
             kind: {:scalar, 0},
             label: :optional,
             name: :changbang_value,
             tag: 10,
             type: :uint32
           }}
        end

        def field_def("changbangValue") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "changbangValue",
             kind: {:scalar, 0},
             label: :optional,
             name: :changbang_value,
             tag: 10,
             type: :uint32
           }}
        end

        def field_def("changbang_value") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "changbangValue",
             kind: {:scalar, 0},
             label: :optional,
             name: :changbang_value,
             tag: 10,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:noting_fafu_1) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "notingFafu1",
             kind: {:scalar, 0},
             label: :optional,
             name: :noting_fafu_1,
             tag: 11,
             type: :uint32
           }}
        end

        def field_def("notingFafu1") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "notingFafu1",
             kind: {:scalar, 0},
             label: :optional,
             name: :noting_fafu_1,
             tag: 11,
             type: :uint32
           }}
        end

        def field_def("noting_fafu_1") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "notingFafu1",
             kind: {:scalar, 0},
             label: :optional,
             name: :noting_fafu_1,
             tag: 11,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:noting_fafu_2) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "notingFafu2",
             kind: {:scalar, 0},
             label: :optional,
             name: :noting_fafu_2,
             tag: 12,
             type: :uint32
           }}
        end

        def field_def("notingFafu2") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "notingFafu2",
             kind: {:scalar, 0},
             label: :optional,
             name: :noting_fafu_2,
             tag: 12,
             type: :uint32
           }}
        end

        def field_def("noting_fafu_2") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "notingFafu2",
             kind: {:scalar, 0},
             label: :optional,
             name: :noting_fafu_2,
             tag: 12,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:noting_fafu_3) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "notingFafu3",
             kind: {:scalar, 0},
             label: :optional,
             name: :noting_fafu_3,
             tag: 13,
             type: :uint32
           }}
        end

        def field_def("notingFafu3") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "notingFafu3",
             kind: {:scalar, 0},
             label: :optional,
             name: :noting_fafu_3,
             tag: 13,
             type: :uint32
           }}
        end

        def field_def("noting_fafu_3") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "notingFafu3",
             kind: {:scalar, 0},
             label: :optional,
             name: :noting_fafu_3,
             tag: 13,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:have_liujumanguan) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveLiujumanguan",
             kind: {:scalar, false},
             label: :optional,
             name: :have_liujumanguan,
             tag: 14,
             type: :bool
           }}
        end

        def field_def("haveLiujumanguan") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveLiujumanguan",
             kind: {:scalar, false},
             label: :optional,
             name: :have_liujumanguan,
             tag: 14,
             type: :bool
           }}
        end

        def field_def("have_liujumanguan") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveLiujumanguan",
             kind: {:scalar, false},
             label: :optional,
             name: :have_liujumanguan,
             tag: 14,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:have_qieshangmanguan) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveQieshangmanguan",
             kind: {:scalar, false},
             label: :optional,
             name: :have_qieshangmanguan,
             tag: 15,
             type: :bool
           }}
        end

        def field_def("haveQieshangmanguan") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveQieshangmanguan",
             kind: {:scalar, false},
             label: :optional,
             name: :have_qieshangmanguan,
             tag: 15,
             type: :bool
           }}
        end

        def field_def("have_qieshangmanguan") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveQieshangmanguan",
             kind: {:scalar, false},
             label: :optional,
             name: :have_qieshangmanguan,
             tag: 15,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:have_biao_dora) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveBiaoDora",
             kind: {:scalar, false},
             label: :optional,
             name: :have_biao_dora,
             tag: 16,
             type: :bool
           }}
        end

        def field_def("haveBiaoDora") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveBiaoDora",
             kind: {:scalar, false},
             label: :optional,
             name: :have_biao_dora,
             tag: 16,
             type: :bool
           }}
        end

        def field_def("have_biao_dora") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveBiaoDora",
             kind: {:scalar, false},
             label: :optional,
             name: :have_biao_dora,
             tag: 16,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:have_gang_biao_dora) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveGangBiaoDora",
             kind: {:scalar, false},
             label: :optional,
             name: :have_gang_biao_dora,
             tag: 17,
             type: :bool
           }}
        end

        def field_def("haveGangBiaoDora") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveGangBiaoDora",
             kind: {:scalar, false},
             label: :optional,
             name: :have_gang_biao_dora,
             tag: 17,
             type: :bool
           }}
        end

        def field_def("have_gang_biao_dora") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveGangBiaoDora",
             kind: {:scalar, false},
             label: :optional,
             name: :have_gang_biao_dora,
             tag: 17,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:ming_dora_immediately_open) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mingDoraImmediatelyOpen",
             kind: {:scalar, false},
             label: :optional,
             name: :ming_dora_immediately_open,
             tag: 18,
             type: :bool
           }}
        end

        def field_def("mingDoraImmediatelyOpen") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mingDoraImmediatelyOpen",
             kind: {:scalar, false},
             label: :optional,
             name: :ming_dora_immediately_open,
             tag: 18,
             type: :bool
           }}
        end

        def field_def("ming_dora_immediately_open") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mingDoraImmediatelyOpen",
             kind: {:scalar, false},
             label: :optional,
             name: :ming_dora_immediately_open,
             tag: 18,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:have_li_dora) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveLiDora",
             kind: {:scalar, false},
             label: :optional,
             name: :have_li_dora,
             tag: 19,
             type: :bool
           }}
        end

        def field_def("haveLiDora") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveLiDora",
             kind: {:scalar, false},
             label: :optional,
             name: :have_li_dora,
             tag: 19,
             type: :bool
           }}
        end

        def field_def("have_li_dora") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveLiDora",
             kind: {:scalar, false},
             label: :optional,
             name: :have_li_dora,
             tag: 19,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:have_gang_li_dora) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveGangLiDora",
             kind: {:scalar, false},
             label: :optional,
             name: :have_gang_li_dora,
             tag: 20,
             type: :bool
           }}
        end

        def field_def("haveGangLiDora") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveGangLiDora",
             kind: {:scalar, false},
             label: :optional,
             name: :have_gang_li_dora,
             tag: 20,
             type: :bool
           }}
        end

        def field_def("have_gang_li_dora") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveGangLiDora",
             kind: {:scalar, false},
             label: :optional,
             name: :have_gang_li_dora,
             tag: 20,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:have_sifenglianda) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveSifenglianda",
             kind: {:scalar, false},
             label: :optional,
             name: :have_sifenglianda,
             tag: 21,
             type: :bool
           }}
        end

        def field_def("haveSifenglianda") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveSifenglianda",
             kind: {:scalar, false},
             label: :optional,
             name: :have_sifenglianda,
             tag: 21,
             type: :bool
           }}
        end

        def field_def("have_sifenglianda") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveSifenglianda",
             kind: {:scalar, false},
             label: :optional,
             name: :have_sifenglianda,
             tag: 21,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:have_sigangsanle) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveSigangsanle",
             kind: {:scalar, false},
             label: :optional,
             name: :have_sigangsanle,
             tag: 22,
             type: :bool
           }}
        end

        def field_def("haveSigangsanle") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveSigangsanle",
             kind: {:scalar, false},
             label: :optional,
             name: :have_sigangsanle,
             tag: 22,
             type: :bool
           }}
        end

        def field_def("have_sigangsanle") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveSigangsanle",
             kind: {:scalar, false},
             label: :optional,
             name: :have_sigangsanle,
             tag: 22,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:have_sijializhi) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveSijializhi",
             kind: {:scalar, false},
             label: :optional,
             name: :have_sijializhi,
             tag: 23,
             type: :bool
           }}
        end

        def field_def("haveSijializhi") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveSijializhi",
             kind: {:scalar, false},
             label: :optional,
             name: :have_sijializhi,
             tag: 23,
             type: :bool
           }}
        end

        def field_def("have_sijializhi") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveSijializhi",
             kind: {:scalar, false},
             label: :optional,
             name: :have_sijializhi,
             tag: 23,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:have_jiuzhongjiupai) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveJiuzhongjiupai",
             kind: {:scalar, false},
             label: :optional,
             name: :have_jiuzhongjiupai,
             tag: 24,
             type: :bool
           }}
        end

        def field_def("haveJiuzhongjiupai") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveJiuzhongjiupai",
             kind: {:scalar, false},
             label: :optional,
             name: :have_jiuzhongjiupai,
             tag: 24,
             type: :bool
           }}
        end

        def field_def("have_jiuzhongjiupai") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveJiuzhongjiupai",
             kind: {:scalar, false},
             label: :optional,
             name: :have_jiuzhongjiupai,
             tag: 24,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:have_sanjiahele) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveSanjiahele",
             kind: {:scalar, false},
             label: :optional,
             name: :have_sanjiahele,
             tag: 25,
             type: :bool
           }}
        end

        def field_def("haveSanjiahele") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveSanjiahele",
             kind: {:scalar, false},
             label: :optional,
             name: :have_sanjiahele,
             tag: 25,
             type: :bool
           }}
        end

        def field_def("have_sanjiahele") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveSanjiahele",
             kind: {:scalar, false},
             label: :optional,
             name: :have_sanjiahele,
             tag: 25,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:have_toutiao) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveToutiao",
             kind: {:scalar, false},
             label: :optional,
             name: :have_toutiao,
             tag: 26,
             type: :bool
           }}
        end

        def field_def("haveToutiao") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveToutiao",
             kind: {:scalar, false},
             label: :optional,
             name: :have_toutiao,
             tag: 26,
             type: :bool
           }}
        end

        def field_def("have_toutiao") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveToutiao",
             kind: {:scalar, false},
             label: :optional,
             name: :have_toutiao,
             tag: 26,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:have_helelianzhuang) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveHelelianzhuang",
             kind: {:scalar, false},
             label: :optional,
             name: :have_helelianzhuang,
             tag: 27,
             type: :bool
           }}
        end

        def field_def("haveHelelianzhuang") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveHelelianzhuang",
             kind: {:scalar, false},
             label: :optional,
             name: :have_helelianzhuang,
             tag: 27,
             type: :bool
           }}
        end

        def field_def("have_helelianzhuang") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveHelelianzhuang",
             kind: {:scalar, false},
             label: :optional,
             name: :have_helelianzhuang,
             tag: 27,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:have_helezhongju) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveHelezhongju",
             kind: {:scalar, false},
             label: :optional,
             name: :have_helezhongju,
             tag: 28,
             type: :bool
           }}
        end

        def field_def("haveHelezhongju") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveHelezhongju",
             kind: {:scalar, false},
             label: :optional,
             name: :have_helezhongju,
             tag: 28,
             type: :bool
           }}
        end

        def field_def("have_helezhongju") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveHelezhongju",
             kind: {:scalar, false},
             label: :optional,
             name: :have_helezhongju,
             tag: 28,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:have_tingpailianzhuang) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveTingpailianzhuang",
             kind: {:scalar, false},
             label: :optional,
             name: :have_tingpailianzhuang,
             tag: 29,
             type: :bool
           }}
        end

        def field_def("haveTingpailianzhuang") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveTingpailianzhuang",
             kind: {:scalar, false},
             label: :optional,
             name: :have_tingpailianzhuang,
             tag: 29,
             type: :bool
           }}
        end

        def field_def("have_tingpailianzhuang") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveTingpailianzhuang",
             kind: {:scalar, false},
             label: :optional,
             name: :have_tingpailianzhuang,
             tag: 29,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:have_tingpaizhongju) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveTingpaizhongju",
             kind: {:scalar, false},
             label: :optional,
             name: :have_tingpaizhongju,
             tag: 30,
             type: :bool
           }}
        end

        def field_def("haveTingpaizhongju") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveTingpaizhongju",
             kind: {:scalar, false},
             label: :optional,
             name: :have_tingpaizhongju,
             tag: 30,
             type: :bool
           }}
        end

        def field_def("have_tingpaizhongju") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveTingpaizhongju",
             kind: {:scalar, false},
             label: :optional,
             name: :have_tingpaizhongju,
             tag: 30,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:have_yifa) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveYifa",
             kind: {:scalar, false},
             label: :optional,
             name: :have_yifa,
             tag: 31,
             type: :bool
           }}
        end

        def field_def("haveYifa") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveYifa",
             kind: {:scalar, false},
             label: :optional,
             name: :have_yifa,
             tag: 31,
             type: :bool
           }}
        end

        def field_def("have_yifa") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveYifa",
             kind: {:scalar, false},
             label: :optional,
             name: :have_yifa,
             tag: 31,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:have_nanruxiru) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveNanruxiru",
             kind: {:scalar, false},
             label: :optional,
             name: :have_nanruxiru,
             tag: 32,
             type: :bool
           }}
        end

        def field_def("haveNanruxiru") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveNanruxiru",
             kind: {:scalar, false},
             label: :optional,
             name: :have_nanruxiru,
             tag: 32,
             type: :bool
           }}
        end

        def field_def("have_nanruxiru") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveNanruxiru",
             kind: {:scalar, false},
             label: :optional,
             name: :have_nanruxiru,
             tag: 32,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:jingsuanyuandian) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "jingsuanyuandian",
             kind: {:scalar, 0},
             label: :optional,
             name: :jingsuanyuandian,
             tag: 33,
             type: :uint32
           }}
        end

        def field_def("jingsuanyuandian") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "jingsuanyuandian",
             kind: {:scalar, 0},
             label: :optional,
             name: :jingsuanyuandian,
             tag: 33,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:shunweima_2) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shunweima2",
             kind: {:scalar, 0},
             label: :optional,
             name: :shunweima_2,
             tag: 34,
             type: :int32
           }}
        end

        def field_def("shunweima2") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shunweima2",
             kind: {:scalar, 0},
             label: :optional,
             name: :shunweima_2,
             tag: 34,
             type: :int32
           }}
        end

        def field_def("shunweima_2") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shunweima2",
             kind: {:scalar, 0},
             label: :optional,
             name: :shunweima_2,
             tag: 34,
             type: :int32
           }}
        end
      ),
      (
        def field_def(:shunweima_3) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shunweima3",
             kind: {:scalar, 0},
             label: :optional,
             name: :shunweima_3,
             tag: 35,
             type: :int32
           }}
        end

        def field_def("shunweima3") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shunweima3",
             kind: {:scalar, 0},
             label: :optional,
             name: :shunweima_3,
             tag: 35,
             type: :int32
           }}
        end

        def field_def("shunweima_3") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shunweima3",
             kind: {:scalar, 0},
             label: :optional,
             name: :shunweima_3,
             tag: 35,
             type: :int32
           }}
        end
      ),
      (
        def field_def(:shunweima_4) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shunweima4",
             kind: {:scalar, 0},
             label: :optional,
             name: :shunweima_4,
             tag: 36,
             type: :int32
           }}
        end

        def field_def("shunweima4") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shunweima4",
             kind: {:scalar, 0},
             label: :optional,
             name: :shunweima_4,
             tag: 36,
             type: :int32
           }}
        end

        def field_def("shunweima_4") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shunweima4",
             kind: {:scalar, 0},
             label: :optional,
             name: :shunweima_4,
             tag: 36,
             type: :int32
           }}
        end
      ),
      (
        def field_def(:bianjietishi) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bianjietishi",
             kind: {:scalar, false},
             label: :optional,
             name: :bianjietishi,
             tag: 37,
             type: :bool
           }}
        end

        def field_def("bianjietishi") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bianjietishi",
             kind: {:scalar, false},
             label: :optional,
             name: :bianjietishi,
             tag: 37,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:ai_level) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aiLevel",
             kind: {:scalar, 0},
             label: :optional,
             name: :ai_level,
             tag: 38,
             type: :uint32
           }}
        end

        def field_def("aiLevel") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aiLevel",
             kind: {:scalar, 0},
             label: :optional,
             name: :ai_level,
             tag: 38,
             type: :uint32
           }}
        end

        def field_def("ai_level") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aiLevel",
             kind: {:scalar, 0},
             label: :optional,
             name: :ai_level,
             tag: 38,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:have_zimosun) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveZimosun",
             kind: {:scalar, false},
             label: :optional,
             name: :have_zimosun,
             tag: 39,
             type: :bool
           }}
        end

        def field_def("haveZimosun") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveZimosun",
             kind: {:scalar, false},
             label: :optional,
             name: :have_zimosun,
             tag: 39,
             type: :bool
           }}
        end

        def field_def("have_zimosun") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveZimosun",
             kind: {:scalar, false},
             label: :optional,
             name: :have_zimosun,
             tag: 39,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:disable_multi_yukaman) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "disableMultiYukaman",
             kind: {:scalar, false},
             label: :optional,
             name: :disable_multi_yukaman,
             tag: 40,
             type: :bool
           }}
        end

        def field_def("disableMultiYukaman") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "disableMultiYukaman",
             kind: {:scalar, false},
             label: :optional,
             name: :disable_multi_yukaman,
             tag: 40,
             type: :bool
           }}
        end

        def field_def("disable_multi_yukaman") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "disableMultiYukaman",
             kind: {:scalar, false},
             label: :optional,
             name: :disable_multi_yukaman,
             tag: 40,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:guyi_mode) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "guyiMode",
             kind: {:scalar, 0},
             label: :optional,
             name: :guyi_mode,
             tag: 41,
             type: :uint32
           }}
        end

        def field_def("guyiMode") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "guyiMode",
             kind: {:scalar, 0},
             label: :optional,
             name: :guyi_mode,
             tag: 41,
             type: :uint32
           }}
        end

        def field_def("guyi_mode") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "guyiMode",
             kind: {:scalar, 0},
             label: :optional,
             name: :guyi_mode,
             tag: 41,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:disable_leijiyiman) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "disableLeijiyiman",
             kind: {:scalar, false},
             label: :optional,
             name: :disable_leijiyiman,
             tag: 42,
             type: :bool
           }}
        end

        def field_def("disableLeijiyiman") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "disableLeijiyiman",
             kind: {:scalar, false},
             label: :optional,
             name: :disable_leijiyiman,
             tag: 42,
             type: :bool
           }}
        end

        def field_def("disable_leijiyiman") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "disableLeijiyiman",
             kind: {:scalar, false},
             label: :optional,
             name: :disable_leijiyiman,
             tag: 42,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:dora3_mode) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dora3Mode",
             kind: {:scalar, 0},
             label: :optional,
             name: :dora3_mode,
             tag: 43,
             type: :uint32
           }}
        end

        def field_def("dora3Mode") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dora3Mode",
             kind: {:scalar, 0},
             label: :optional,
             name: :dora3_mode,
             tag: 43,
             type: :uint32
           }}
        end

        def field_def("dora3_mode") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dora3Mode",
             kind: {:scalar, 0},
             label: :optional,
             name: :dora3_mode,
             tag: 43,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:xuezhandaodi) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xuezhandaodi",
             kind: {:scalar, 0},
             label: :optional,
             name: :xuezhandaodi,
             tag: 44,
             type: :uint32
           }}
        end

        def field_def("xuezhandaodi") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xuezhandaodi",
             kind: {:scalar, 0},
             label: :optional,
             name: :xuezhandaodi,
             tag: 44,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:huansanzhang) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "huansanzhang",
             kind: {:scalar, 0},
             label: :optional,
             name: :huansanzhang,
             tag: 45,
             type: :uint32
           }}
        end

        def field_def("huansanzhang") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "huansanzhang",
             kind: {:scalar, 0},
             label: :optional,
             name: :huansanzhang,
             tag: 45,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:chuanma) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chuanma",
             kind: {:scalar, 0},
             label: :optional,
             name: :chuanma,
             tag: 46,
             type: :uint32
           }}
        end

        def field_def("chuanma") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chuanma",
             kind: {:scalar, 0},
             label: :optional,
             name: :chuanma,
             tag: 46,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:disable_double_yakuman) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "disableDoubleYakuman",
             kind: {:scalar, 0},
             label: :optional,
             name: :disable_double_yakuman,
             tag: 62,
             type: :uint32
           }}
        end

        def field_def("disableDoubleYakuman") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "disableDoubleYakuman",
             kind: {:scalar, 0},
             label: :optional,
             name: :disable_double_yakuman,
             tag: 62,
             type: :uint32
           }}
        end

        def field_def("disable_double_yakuman") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "disableDoubleYakuman",
             kind: {:scalar, 0},
             label: :optional,
             name: :disable_double_yakuman,
             tag: 62,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:disable_composite_yakuman) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "disableCompositeYakuman",
             kind: {:scalar, 0},
             label: :optional,
             name: :disable_composite_yakuman,
             tag: 63,
             type: :uint32
           }}
        end

        def field_def("disableCompositeYakuman") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "disableCompositeYakuman",
             kind: {:scalar, 0},
             label: :optional,
             name: :disable_composite_yakuman,
             tag: 63,
             type: :uint32
           }}
        end

        def field_def("disable_composite_yakuman") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "disableCompositeYakuman",
             kind: {:scalar, 0},
             label: :optional,
             name: :disable_composite_yakuman,
             tag: 63,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:enable_shiti) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "enableShiti",
             kind: {:scalar, 0},
             label: :optional,
             name: :enable_shiti,
             tag: 64,
             type: :uint32
           }}
        end

        def field_def("enableShiti") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "enableShiti",
             kind: {:scalar, 0},
             label: :optional,
             name: :enable_shiti,
             tag: 64,
             type: :uint32
           }}
        end

        def field_def("enable_shiti") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "enableShiti",
             kind: {:scalar, 0},
             label: :optional,
             name: :enable_shiti,
             tag: 64,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:enable_nontsumo_liqi) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "enableNontsumoLiqi",
             kind: {:scalar, 0},
             label: :optional,
             name: :enable_nontsumo_liqi,
             tag: 65,
             type: :uint32
           }}
        end

        def field_def("enableNontsumoLiqi") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "enableNontsumoLiqi",
             kind: {:scalar, 0},
             label: :optional,
             name: :enable_nontsumo_liqi,
             tag: 65,
             type: :uint32
           }}
        end

        def field_def("enable_nontsumo_liqi") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "enableNontsumoLiqi",
             kind: {:scalar, 0},
             label: :optional,
             name: :enable_nontsumo_liqi,
             tag: 65,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:disable_double_wind_four_fu) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "disableDoubleWindFourFu",
             kind: {:scalar, 0},
             label: :optional,
             name: :disable_double_wind_four_fu,
             tag: 66,
             type: :uint32
           }}
        end

        def field_def("disableDoubleWindFourFu") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "disableDoubleWindFourFu",
             kind: {:scalar, 0},
             label: :optional,
             name: :disable_double_wind_four_fu,
             tag: 66,
             type: :uint32
           }}
        end

        def field_def("disable_double_wind_four_fu") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "disableDoubleWindFourFu",
             kind: {:scalar, 0},
             label: :optional,
             name: :disable_double_wind_four_fu,
             tag: 66,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:disable_angang_guoshi) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "disableAngangGuoshi",
             kind: {:scalar, 0},
             label: :optional,
             name: :disable_angang_guoshi,
             tag: 67,
             type: :uint32
           }}
        end

        def field_def("disableAngangGuoshi") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "disableAngangGuoshi",
             kind: {:scalar, 0},
             label: :optional,
             name: :disable_angang_guoshi,
             tag: 67,
             type: :uint32
           }}
        end

        def field_def("disable_angang_guoshi") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "disableAngangGuoshi",
             kind: {:scalar, 0},
             label: :optional,
             name: :disable_angang_guoshi,
             tag: 67,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:enable_renhe) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "enableRenhe",
             kind: {:scalar, 0},
             label: :optional,
             name: :enable_renhe,
             tag: 68,
             type: :uint32
           }}
        end

        def field_def("enableRenhe") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "enableRenhe",
             kind: {:scalar, 0},
             label: :optional,
             name: :enable_renhe,
             tag: 68,
             type: :uint32
           }}
        end

        def field_def("enable_renhe") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "enableRenhe",
             kind: {:scalar, 0},
             label: :optional,
             name: :enable_renhe,
             tag: 68,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:enable_baopai_extend_settings) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "enableBaopaiExtendSettings",
             kind: {:scalar, 0},
             label: :optional,
             name: :enable_baopai_extend_settings,
             tag: 69,
             type: :uint32
           }}
        end

        def field_def("enableBaopaiExtendSettings") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "enableBaopaiExtendSettings",
             kind: {:scalar, 0},
             label: :optional,
             name: :enable_baopai_extend_settings,
             tag: 69,
             type: :uint32
           }}
        end

        def field_def("enable_baopai_extend_settings") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "enableBaopaiExtendSettings",
             kind: {:scalar, 0},
             label: :optional,
             name: :enable_baopai_extend_settings,
             tag: 69,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:fanfu) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fanfu",
             kind: {:scalar, 0},
             label: :optional,
             name: :fanfu,
             tag: 70,
             type: :uint32
           }}
        end

        def field_def("fanfu") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fanfu",
             kind: {:scalar, 0},
             label: :optional,
             name: :fanfu,
             tag: 70,
             type: :uint32
           }}
        end

        []
      ),
      def field_def(_) do
        {:error, :no_such_field}
      end
    ]
  )

  (
    @spec unknown_fields(struct) :: [{non_neg_integer, Protox.Types.tag(), binary}]
    def unknown_fields(msg) do
      msg.__uf__
    end

    @spec unknown_fields_name() :: :__uf__
    def unknown_fields_name() do
      :__uf__
    end

    @spec clear_unknown_fields(struct) :: struct
    def clear_unknown_fields(msg) do
      struct!(msg, [{unknown_fields_name(), []}])
    end
  )

  (
    @spec required_fields() :: []
    def required_fields() do
      []
    end
  )

  (
    @spec syntax() :: atom()
    def syntax() do
      :proto3
    end
  )

  [
    @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
    def default(:init_point) do
      {:ok, 0}
    end,
    def default(:fandian) do
      {:ok, 0}
    end,
    def default(:can_jifei) do
      {:ok, false}
    end,
    def default(:tianbian_value) do
      {:ok, 0}
    end,
    def default(:liqibang_value) do
      {:ok, 0}
    end,
    def default(:changbang_value) do
      {:ok, 0}
    end,
    def default(:noting_fafu_1) do
      {:ok, 0}
    end,
    def default(:noting_fafu_2) do
      {:ok, 0}
    end,
    def default(:noting_fafu_3) do
      {:ok, 0}
    end,
    def default(:have_liujumanguan) do
      {:ok, false}
    end,
    def default(:have_qieshangmanguan) do
      {:ok, false}
    end,
    def default(:have_biao_dora) do
      {:ok, false}
    end,
    def default(:have_gang_biao_dora) do
      {:ok, false}
    end,
    def default(:ming_dora_immediately_open) do
      {:ok, false}
    end,
    def default(:have_li_dora) do
      {:ok, false}
    end,
    def default(:have_gang_li_dora) do
      {:ok, false}
    end,
    def default(:have_sifenglianda) do
      {:ok, false}
    end,
    def default(:have_sigangsanle) do
      {:ok, false}
    end,
    def default(:have_sijializhi) do
      {:ok, false}
    end,
    def default(:have_jiuzhongjiupai) do
      {:ok, false}
    end,
    def default(:have_sanjiahele) do
      {:ok, false}
    end,
    def default(:have_toutiao) do
      {:ok, false}
    end,
    def default(:have_helelianzhuang) do
      {:ok, false}
    end,
    def default(:have_helezhongju) do
      {:ok, false}
    end,
    def default(:have_tingpailianzhuang) do
      {:ok, false}
    end,
    def default(:have_tingpaizhongju) do
      {:ok, false}
    end,
    def default(:have_yifa) do
      {:ok, false}
    end,
    def default(:have_nanruxiru) do
      {:ok, false}
    end,
    def default(:jingsuanyuandian) do
      {:ok, 0}
    end,
    def default(:shunweima_2) do
      {:ok, 0}
    end,
    def default(:shunweima_3) do
      {:ok, 0}
    end,
    def default(:shunweima_4) do
      {:ok, 0}
    end,
    def default(:bianjietishi) do
      {:ok, false}
    end,
    def default(:ai_level) do
      {:ok, 0}
    end,
    def default(:have_zimosun) do
      {:ok, false}
    end,
    def default(:disable_multi_yukaman) do
      {:ok, false}
    end,
    def default(:guyi_mode) do
      {:ok, 0}
    end,
    def default(:disable_leijiyiman) do
      {:ok, false}
    end,
    def default(:dora3_mode) do
      {:ok, 0}
    end,
    def default(:xuezhandaodi) do
      {:ok, 0}
    end,
    def default(:huansanzhang) do
      {:ok, 0}
    end,
    def default(:chuanma) do
      {:ok, 0}
    end,
    def default(:disable_double_yakuman) do
      {:ok, 0}
    end,
    def default(:disable_composite_yakuman) do
      {:ok, 0}
    end,
    def default(:enable_shiti) do
      {:ok, 0}
    end,
    def default(:enable_nontsumo_liqi) do
      {:ok, 0}
    end,
    def default(:disable_double_wind_four_fu) do
      {:ok, 0}
    end,
    def default(:disable_angang_guoshi) do
      {:ok, 0}
    end,
    def default(:enable_renhe) do
      {:ok, 0}
    end,
    def default(:enable_baopai_extend_settings) do
      {:ok, 0}
    end,
    def default(:fanfu) do
      {:ok, 0}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end