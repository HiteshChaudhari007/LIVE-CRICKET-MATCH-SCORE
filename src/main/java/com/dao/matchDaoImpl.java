package com.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Repository;

import com.model.Match;

@Repository
public class matchDaoImpl implements matchDao {

	public List<Match> saveMatch() {
		List<Match> matches = new ArrayList<>();
		try {
			String url = "https://www.cricbuzz.com/cricket-match/live-scores";
			Document document = Jsoup.connect(url).get();
			Elements liveScoreElements = document.select("div.cb-mtch-lst.cb-tms-itm");
			for (Element match : liveScoreElements) {
				String teamsHeading = match.select("h3.cb-lv-scr-mtch-hdr").select("a").text();
				String matchNumberVenue = match.select("span").text();
				Elements matchBatTeamInfo = match.select("div.cb-hmscg-bat-txt");
				String battingTeam = matchBatTeamInfo.select("div.cb-hmscg-tm-nm").text();
				String score = matchBatTeamInfo.select("div.cb-hmscg-tm-nm+div").text();
				Elements bowlTeamInfo = match.select("div.cb-hmscg-bwl-txt");
				String bowlTeam = bowlTeamInfo.select("div.cb-hmscg-tm-nm").text();
				String bowlTeamScore = bowlTeamInfo.select("div.cb-hmscg-tm-nm+div").text();
				String textLive = match.select("div.cb-text-live").text();
				String textComplete = match.select("div.cb-text-complete").text();
				String matchLink = match.select("a.cb-lv-scrs-well.cb-lv-scrs-well-live").attr("href").toString();

				Match match1 = new Match();
				match1.setTeamHeading(teamsHeading);
				match1.setMatchNumberVenue(matchNumberVenue);
				match1.setBattingTeam(battingTeam);
				match1.setBattingTeamScore(score);
				match1.setBowlTeam(bowlTeam);
				match1.setBowlTeamScore(bowlTeamScore);
				match1.setLiveText(textLive);
				match1.setMatchLink(matchLink);
				match1.setTextComplete(textComplete);

				matches.add(match1);

			}

		} catch (IOException e) {
			System.out.println(e);

		}
		return matches;
	}

	@Override
	public List<Match> getLive() {

		return saveMatch();
	}
}
