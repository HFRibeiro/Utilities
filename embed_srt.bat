@echo off
setlocal enabledelayedexpansion

echo.
echo 🎬 Gerando vídeos com legendas embutidas (substituindo as antigas)...
echo.

REM Loop through video files (.mp4 and .mkv)
for %%V in (*.mp4 *.mkv) do (
    set "VIDEO=%%V"
    set "BASENAME=%%~nV"
    set "EXT=%%~xV"
    set "SRT_FILE=!BASENAME!.srt"
    set "OUT_FILE=!BASENAME!_with_subs!EXT!"

    if exist "!SRT_FILE!" (
        echo ▶️  Processando: !VIDEO!
        echo 💬  Legenda:     !SRT_FILE!
        echo 📄  Saída:       !OUT_FILE!
        echo.

        REM Select subtitle codec based on container type
        if /I "!EXT!"==".mp4" (
            set "SUB_CODEC=mov_text"
        ) else (
            set "SUB_CODEC=srt"
        )

        REM Run ffmpeg with character encoding fix and only video/audio from source
        ffmpeg.exe -i "!VIDEO!" -sub_charenc windows-1252 -i "!SRT_FILE!" ^
        -map 0:v -map 0:a -map 1 -c:v copy -c:a copy -c:s !SUB_CODEC! ^
        -metadata:s:s:0 language=por "!OUT_FILE!"

        if !ERRORLEVEL! NEQ 0 (
            echo ❌ Erro ao processar !VIDEO!
        ) else (
            echo ✅ Criado: !OUT_FILE!
        )
        echo.
    ) else (
        echo ⚠️  Nenhuma legenda encontrada para: !VIDEO!
    )
)

echo 🟢 Finalizado.
pause
endlocal
